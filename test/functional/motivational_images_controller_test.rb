require 'test_helper'

class MotivationalImagesControllerTest < ActionController::TestCase
  setup do
    @motivational_image = motivational_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivational_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivational_image" do
    assert_difference('MotivationalImage.count') do
      post :create, motivational_image: { attachment: @motivational_image.attachment, caption: @motivational_image.caption, user: @motivational_image.user }
    end

    assert_redirected_to motivational_image_path(assigns(:motivational_image))
  end

  test "should show motivational_image" do
    get :show, id: @motivational_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivational_image
    assert_response :success
  end

  test "should update motivational_image" do
    put :update, id: @motivational_image, motivational_image: { attachment: @motivational_image.attachment, caption: @motivational_image.caption, user: @motivational_image.user }
    assert_redirected_to motivational_image_path(assigns(:motivational_image))
  end

  test "should destroy motivational_image" do
    assert_difference('MotivationalImage.count', -1) do
      delete :destroy, id: @motivational_image
    end

    assert_redirected_to motivational_images_path
  end
end
