require 'test_helper'

class PayTypemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_typems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_typem" do
    assert_difference('PayTypem.count') do
      post :create, :pay_typem => { }
    end

    assert_redirected_to pay_typem_path(assigns(:pay_typem))
  end

  test "should show pay_typem" do
    get :show, :id => pay_typems(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pay_typems(:one).to_param
    assert_response :success
  end

  test "should update pay_typem" do
    put :update, :id => pay_typems(:one).to_param, :pay_typem => { }
    assert_redirected_to pay_typem_path(assigns(:pay_typem))
  end

  test "should destroy pay_typem" do
    assert_difference('PayTypem.count', -1) do
      delete :destroy, :id => pay_typems(:one).to_param
    end

    assert_redirected_to pay_typems_path
  end
end
