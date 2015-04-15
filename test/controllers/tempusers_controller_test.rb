require 'test_helper'

class TempusersControllerTest < ActionController::TestCase
  setup do
    @tempuser = tempusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tempusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tempuser" do
    assert_difference('Tempuser.count') do
      post :create, tempuser: { pku_id: @tempuser.pku_id }
    end

    assert_redirected_to tempuser_path(assigns(:tempuser))
  end

  test "should show tempuser" do
    get :show, id: @tempuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tempuser
    assert_response :success
  end

  test "should update tempuser" do
    patch :update, id: @tempuser, tempuser: { pku_id: @tempuser.pku_id }
    assert_redirected_to tempuser_path(assigns(:tempuser))
  end

  test "should destroy tempuser" do
    assert_difference('Tempuser.count', -1) do
      delete :destroy, id: @tempuser
    end

    assert_redirected_to tempusers_path
  end
end
