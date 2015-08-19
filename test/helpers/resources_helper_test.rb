require 'test_helper'

class ResourcesHelperTest < ActionView::TestCase

  test "should return a valid api url" do
    url = "http://www.example.com"
    access_key = ENV['SCREENSHOTLAYER_ACCESS_KEY']
    secret_keyword = ENV['SCREENSHOTLAYER_SECRET_KEYWORD']
    result = "https://api.screenshotlayer.com/api/capture?access_key="\
    "#{access_key}&secret_key=384a09523058f729613c786f676b898e"\
    "&format=PNG&url=http%3A%2F%2Fwww.example.com&viewport=1440x900&width=288"
    assert_equal result, screenshotlayer(url)
  end
end
