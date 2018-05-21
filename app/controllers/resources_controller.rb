class ResourcesController < ApplicationController

  def create
  end

  def show
    resource = Resource.find(params[:id])
    render json: resource, :include => [:type, :lessons], status: 200
  end


end
