module ApplicationHelper

  # Returns the full page title for the current page
  def full_title(page_title = "")
    base_title = "LearnersList"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_selected?(path)
    "selected" if current_page?(path)
  end
end
