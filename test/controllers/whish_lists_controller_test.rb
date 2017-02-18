require 'test_helper'

class WhishListsControllerTest < ActionController::TestCase
  setup do
    @whish_list = whish_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whish_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whish_list" do
    assert_difference('WhishList.count') do
      post :create, whish_list: { product_id: @whish_list.product_id, user_id: @whish_list.user_id }
    end

    assert_redirected_to whish_list_path(assigns(:whish_list))
  end

  test "should show whish_list" do
    get :show, id: @whish_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whish_list
    assert_response :success
  end

  test "should update whish_list" do
    patch :update, id: @whish_list, whish_list: { product_id: @whish_list.product_id, user_id: @whish_list.user_id }
    assert_redirected_to whish_list_path(assigns(:whish_list))
  end

  test "should destroy whish_list" do
    assert_difference('WhishList.count', -1) do
      delete :destroy, id: @whish_list
    end

    assert_redirected_to whish_lists_path
  end
end
