require 'test_helper'

class ResourcesIndexTest < ActionDispatch::IntegrationTest
  include ResourcesHelper
  
  def setup
    @user = users(:magnus)
    post_via_redirect user_session_path, 'user[email]' => 'example@example.com',
                                         'user[password]' => 'password'
  end

  test "index including pagination" do
    assert_template 'static_pages/home'
    assert_select 'div.pagination'
    first_page_of_resources = @user.resources.paginate(page: 1)
    first_page_of_resources.each do |resource|
      assert_select 'a[href=?]', resource.url, text: urltitle(resource)
    end
  end

  test "creating a resource" do
    # Invalid submission
    assert_no_difference 'Resource.count' do
      xhr :post, resources_path, resource: { url: "",
                                       description: "" }
    end
    # Valid submission
    description = "An example website in the test."
    assert_difference 'Resource.count', 1 do
      xhr :post, resources_path, resource: { url: "http://www.example.com",
                                       description: description }
    end
    assert_not flash.empty?
    assert_match description, response.body
  end

  test "updating a resource" do
    description = "An updated example description."
    first_resource = @user.resources.paginate(page: 1).first
    # Invalid submission
    xhr :patch, resource_path(first_resource),
                resource: { url: "",
                            description: "" }
    first_resource.reload
    assert_not_equal description, first_resource.description
    # Valid submission
    xhr :patch, resource_path(first_resource),
                resource: { url: "http://www.example.com",
                            description: description }
    assert_not flash.empty?
    first_resource.reload
    assert_equal description, first_resource.description
  end

  test "deleting a resource" do
    assert_select 'form.delete-resource'
    first_resource = @user.resources.paginate(page: 1).first
    assert_difference 'Resource.count', -1 do
      xhr :delete, resource_path(first_resource)
    end
    assert_not flash.empty?
  end
end
