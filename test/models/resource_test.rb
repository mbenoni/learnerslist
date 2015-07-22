require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  
  def setup
    @resource = Resource.new(url: "www.google.com", 
                             description: "Good website.")
  end

  test "should be valid" do
    assert @resource.valid?
  end
end
