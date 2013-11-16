require 'test_helper'

class FoodIntakeLogsControllerTest < ActionController::TestCase
  setup do
    @food_intake_log = food_intake_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_intake_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_intake_log" do
    assert_difference('FoodIntakeLog.count') do
      post :create, food_intake_log: { amount: @food_intake_log.amount, intake_date: @food_intake_log.intake_date, intake_time: @food_intake_log.intake_time }
    end

    assert_redirected_to food_intake_log_path(assigns(:food_intake_log))
  end

  test "should show food_intake_log" do
    get :show, id: @food_intake_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_intake_log
    assert_response :success
  end

  test "should update food_intake_log" do
    put :update, id: @food_intake_log, food_intake_log: { amount: @food_intake_log.amount, intake_date: @food_intake_log.intake_date, intake_time: @food_intake_log.intake_time }
    assert_redirected_to food_intake_log_path(assigns(:food_intake_log))
  end

  test "should destroy food_intake_log" do
    assert_difference('FoodIntakeLog.count', -1) do
      delete :destroy, id: @food_intake_log
    end

    assert_redirected_to food_intake_logs_path
  end
end
