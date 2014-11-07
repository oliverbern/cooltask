require 'test_helper'

class ListsControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	
  setup do
    @list = lists(:one)
  end

  test "should create list" do
		sign_in users(:one)
    assert_difference('List.count') do
		post :create, list: { description: @list.description, title: @list.title }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
		sign_in users(:one)
    get :index
    assert_response :success
  end

  test "should destroy list" do
		sign_in users(:one)
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end
end
