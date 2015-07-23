class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    @resource  = Resource.new
  end
end
