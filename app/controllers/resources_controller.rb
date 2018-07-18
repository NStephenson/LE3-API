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
    lesson = Lesson.find_or_create_by(name: params[:lesson][:name].gsub(/[^\w\s]/, ''))

    if !resource
      resource = Resource.new(resource_params)
      resource.type = Type.find_or_create_by(name: params[:resource][:type].downcase)
    end
    
    resource.lessons << lesson

    if resource.save
      render json: resource
    else
      render json: {resource: resource, errors: resource.errors.full_messages}, status: 422
    end
  end

  def show
    resource = Resource.find(params[:id])
    render json: resource, :include => [:type, :lessons], status: 200
  end

  def update
    resource = Resource.find(params[:id])
    resource.update(resource_params)
    resource.type = Type.find_or_create_by(name: params[:resource][:type].downcase)

    if resource.save
      render json: resource, status: 204
    else
      render json: resource, status: 422
    end  
  end

  def destroy
    resource = Resource.find(params[:id])
    if !params[:slug] || resource.lessons.length == 1
      Resource.find(params[:id]).destroy
      render status: 202
    else 
      lesson = Lesson.find_by(name: deslug(params[:slug]))
      lesson.resources.delete(resource)
      lesson.save
      render status: 204
    end

  end

  private 

  def deslug(slug)
    slug.split('_').join(" ")
  end

  def resource_params
    params.require(:resource).permit(:name, :description, :link, :type_id)
  end


end
