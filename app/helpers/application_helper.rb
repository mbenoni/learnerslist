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
end
