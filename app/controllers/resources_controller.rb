class ResourcesController < ApplicationController

  def index
    lesson = Lesson.find_or_create_by(name: deslug(params[:slug]))
    if lesson
      render json: lesson.resources, :include => [:type], status: 200
    # else
    #   render json: {error: "Lesson not found"}, status: 404
    end
  end

  def create
    resource = Resource.find_by(link: params[:resource][:link])
    lesson = Lesson.find_or_create_by(name: params[:lesson][:name])

    if !resource
      resource = Resource.new(resource_params)
      resource.type = Type.find_or_create_by(name: params[:resource][:type].downcase)
    end
    
    resource.lessons << lesson

    if resource.save
      render json: resource
    else
      render json: resource, status: 422
    end
  end

  def show
    resource = Resource.find(params[:id])
    render json: resource, :include => [:type, :lessons], status: 200
  end

  def edit
    resource = Resource.find(params[:id])
    resource.update(resource_params)

    if resource.save
      render json: resource, status: 204
    else
      render json: resource, status: 422
    end  
  end

  def destroy
    Resource.find(params[:id]).destroy
    render status: 202
  end

  private 

  def deslug(slug)
    slug.split('_').join(" ")
  end

  def resource_params
    params.require(:resource).permit(:name, :description, :link, :type_id)
  end


end
