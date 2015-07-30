module ResourcesHelper

  def urltitle(resource)
    url = resource.url
    uri = URI.parse(url)
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    uri.host.sub(/\Awww\./, "").capitalize
  end

  def completed?
    self.completed == true
  end

  def label_text(resource)
    if resource.completed?
      "Completed"
    else
      "Completed?"
    end
  end

  def tags(resource)
    raw resource.tag_list.map { |t| link_to t, tag_path(t) }.join(" ")
  end
end
