class ResourcesController < ApplicationController

  def index
    @resources = Resource.all.order(created_at: :desc)
    @resource  = Resource.new
  end

  def create
  @resource = Resource.new(resource_params)
 
  respond_to do |format|
    if @resource.save
      format.html { redirect_to @resource, success: 'New resource added' }
      format.js   { flash.now[:success] = "New resource added" }
    else
      format.html { render action: "new" }
      format.js   {}
    end
  end
end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:success] = "Resource updated"
      redirect_to resources_path
    else
      render 'index'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:success] = "Resource deleted"
    redirect_to resources_path
  end

  private

    def resource_params
      params.require(:resource).permit(:url, :description)
    end
end
