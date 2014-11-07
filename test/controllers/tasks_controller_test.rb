require 'test_helper'

class TasksControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  setup do
    @task = tasks(:one)
		users(:one).skip_confirmation!
		users(:one).save!
  end

  test "should get index" do
		sign_in users(:one)
    get :index, list_id: lists(:one).id
    assert_response :success
    assert_not_nil assigns(:tasks)
  end
  
  #test "should get new" do
  #  get :new
  #  assert_response :success
  #end

  test "should create task" do
		sign_in users(:one)
    assert_difference('Task.count') do
      post :create, list_id: lists(:one).id, task: { body: "Here is a test body", days: 3, done: false}
    end

    assert_redirected_to list_tasks_path(lists(:one).id)
  end

  #test "should show task" do
  #  get :show, id: @task
  #  assert_response :success
  #end

  #test "should destroy task" do
	#	sign_in users(:one)
  #  assert_difference('Task.count', -1) do
  #    delete :destroy, id: @task
  #  end
  #
  #  assert_redirected_to tasks_path
  #end
end
