module ResourcesHelper

  def urltitle(url)
    uri = URI.parse(url)
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    uri.host.sub(/\Awww\./, "").capitalize
  end
end
