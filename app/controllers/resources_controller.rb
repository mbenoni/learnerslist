class ResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @resource  = current_user.resources.build
    if params[:tag]
      @resources = Resource.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 10)
    else
      @resources = Resource.paginate(page: params[:page], per_page: 10)
    end
  end

  def create
    @resource  = current_user.resources.build(resource_params)
    @resources = Resource.paginate(page: params[:page], per_page: 10)
   
    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_path,
                      success: "New resource added" }
        format.js   { flash.now[:success] = "New resource added" }
      else
        format.html { render 'index' }
        format.js   {}
      end
    end
  end

  def update
    @resource = Resource.find(params[:id])
    
    respond_to do |format|
      if @resource.update_attributes(resource_params)
        format.html { redirect_to resources_path,
                      success: "Resource updated" }
        format.js   { flash.now[:success] = "Resource updated" }
      else
        format.html { render 'index' }
        format.js   {}
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_path,
                    success: "Resource deleted" }
      format.js   { flash.now[:success] = "Resource deleted" }
    end
  end

  private

    def resource_params
      params.require(:resource).permit(:url, :description, :tag_list, :completed)
    end
end
