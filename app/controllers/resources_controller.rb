class ResourcesController < ApplicationController

  def index
    @resources = Resource.all.order(created_at: :desc)
    @resource  = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = "New resource added"
      redirect_to resources_path
    else
      @resources = Resource.all.order(created_at: :desc)
      render :index
    end
  end

  private

    def resource_params
      params.require(:resource).permit(:url, :description)
    end
end
