require 'test_helper'

class ChoreAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chore_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chore_association" do
    assert_difference('ChoreAssociation.count') do
      post :create, :chore_association => { }
    end

    assert_redirected_to chore_association_path(assigns(:chore_association))
  end

  test "should show chore_association" do
    get :show, :id => chore_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chore_associations(:one).to_param
    assert_response :success
  end

  test "should update chore_association" do
    put :update, :id => chore_associations(:one).to_param, :chore_association => { }
    assert_redirected_to chore_association_path(assigns(:chore_association))
  end

  test "should destroy chore_association" do
    assert_difference('ChoreAssociation.count', -1) do
      delete :destroy, :id => chore_associations(:one).to_param
    end

    assert_redirected_to chore_associations_path
  end
end
