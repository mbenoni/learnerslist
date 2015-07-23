require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  
  def setup
    @resource = Resource.new(url: "www.example.com", 
                             description: "Example website.")
  end

  test "should be valid" do
    assert @resource.valid?
  end

  test "url should be present" do
    @resource.url = ""
    assert @resource.invalid?
  end

  test "description should be present" do
    @resource.description = ""
    assert @resource.invalid?
  end

  test "should accept valid urls" do
    valid_urls = %w[http://www.example.com https://example.designs example.com/category?page=2&limit=10]
    valid_urls.each do |valid_url|
      @resource.url = valid_url
      assert @resource.valid?, "#{valid_url.inspect} should be invalid"
    end
  end

  test "should reject invalid urls" do
    invalid_urls = %w[htt://www.example.com /example.\ designs example.com/category!]
    invalid_urls.each do |invalid_url|
      @resource.url = invalid_url
      assert @resource.invalid?, "#{invalid_url.inspect} should be invalid"
    end
  end

  test "description should be maximum 80 characters" do
    @resource.description = "a" * 81
    assert @resource.invalid?
  end
end
