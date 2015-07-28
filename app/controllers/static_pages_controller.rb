class StaticPagesController < ApplicationController
  
  def home
    if user_signed_in?
      @resource  = current_user.resources.build
      if params[:tag]
        @resources = current_user.resources.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 10)
      else
        @resources = current_user.resources.paginate(page: params[:page], per_page: 10)
      end
    end
  end

  def about
  end
end
