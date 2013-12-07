require 'test_helper'

class ListSpacesControllerTest < ActionController::TestCase
  setup do
    @list_space = list_spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_space" do
    assert_difference('ListSpace.count') do
      post :create, list_space: { address1: @list_space.address1, address2: @list_space.address2, area: @list_space.area, available_date: @list_space.available_date, city: @list_space.city, description: @list_space.description, price: @list_space.price, state: @list_space.state, zipcode: @list_space.zipcode }
    end

    assert_redirected_to list_space_path(assigns(:list_space))
  end

  test "should show list_space" do
    get :show, id: @list_space
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_space
    assert_response :success
  end

  test "should update list_space" do
    put :update, id: @list_space, list_space: { address1: @list_space.address1, address2: @list_space.address2, area: @list_space.area, available_date: @list_space.available_date, city: @list_space.city, description: @list_space.description, price: @list_space.price, state: @list_space.state, zipcode: @list_space.zipcode }
    assert_redirected_to list_space_path(assigns(:list_space))
  end

  test "should destroy list_space" do
    assert_difference('ListSpace.count', -1) do
      delete :destroy, id: @list_space
    end

    assert_redirected_to list_spaces_path
  end
end
