require 'cgi' unless defined?(CGI)
require 'digest' unless defined?(Digest)

module ResourcesHelper

  def urltitle(resource)
    url = resource.url
    uri = URI.parse(url)
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

  def screenshotlayer(url)
  # set access key
  access_key = Rails.application.secrets.screenshotlayer_access_key

  # set secret keyword (defined in account dashboard)
  secret_keyword = Rails.application.secrets.screenshotlayer_secret_keyword

  # define parameters
  parameters = {
    :url         => url,
    :width       => "288",
    :viewport    => "1440x900",
    :format      => "PNG"
  }
   
  query = parameters.
    sort_by {|s| s[0].to_s }. 
    select {|s| s[1] }.       
    map {|s| s.map {|v| CGI::escape(v.to_s) }.join('=') }.
    join('&')
  
  # generate md5 secret key
  secret_key = Digest::MD5.hexdigest(url + secret_keyword)
 
  "https://api.screenshotlayer.com/api/capture?access_key=#{access_key}&secret_key=#{secret_key}&#{query}"
  end
end
