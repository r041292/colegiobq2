require 'test_helper'

class AdministradoresControllerTest < ActionController::TestCase
  setup do
    @administradore = administradores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administradores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administradore" do
    assert_difference('Administradore.count') do
      post :create, administradore: { password_digest: @administradore.password_digest, user_type: @administradore.user_type }
    end

    assert_redirected_to administradore_path(assigns(:administradore))
  end

  test "should show administradore" do
    get :show, id: @administradore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administradore
    assert_response :success
  end

  test "should update administradore" do
    patch :update, id: @administradore, administradore: { password_digest: @administradore.password_digest, user_type: @administradore.user_type }
    assert_redirected_to administradore_path(assigns(:administradore))
  end

  test "should destroy administradore" do
    assert_difference('Administradore.count', -1) do
      delete :destroy, id: @administradore
    end

    assert_redirected_to administradores_path
  end
end
