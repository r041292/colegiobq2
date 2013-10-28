require 'test_helper'

class ColegiosControllerTest < ActionController::TestCase
  setup do
    @colegio = colegios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colegios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colegio" do
    assert_difference('Colegio.count') do
      post :create, colegio: { direccion: @colegio.direccion, enfasis: @colegio.enfasis, estrato: @colegio.estrato, latitud: @colegio.latitud, longitud: @colegio.longitud, nivel_icfes: @colegio.nivel_icfes, nombre: @colegio.nombre, numero_rankin: @colegio.numero_rankin, suma_rankin: @colegio.suma_rankin }
    end

    assert_redirected_to colegio_path(assigns(:colegio))
  end

  test "should show colegio" do
    get :show, id: @colegio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colegio
    assert_response :success
  end

  test "should update colegio" do
    patch :update, id: @colegio, colegio: { direccion: @colegio.direccion, enfasis: @colegio.enfasis, estrato: @colegio.estrato, latitud: @colegio.latitud, longitud: @colegio.longitud, nivel_icfes: @colegio.nivel_icfes, nombre: @colegio.nombre, numero_rankin: @colegio.numero_rankin, suma_rankin: @colegio.suma_rankin }
    assert_redirected_to colegio_path(assigns(:colegio))
  end

  test "should destroy colegio" do
    assert_difference('Colegio.count', -1) do
      delete :destroy, id: @colegio
    end

    assert_redirected_to colegios_path
  end
end
