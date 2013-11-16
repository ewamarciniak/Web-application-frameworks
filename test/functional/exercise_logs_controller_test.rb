require 'test_helper'

class ExerciseLogsControllerTest < ActionController::TestCase
  setup do
    @exercise_log = exercise_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_log" do
    assert_difference('ExerciseLog.count') do
      post :create, exercise_log: { calories_burned: @exercise_log.calories_burned, length: @exercise_log.length }
    end

    assert_redirected_to exercise_log_path(assigns(:exercise_log))
  end

  test "should show exercise_log" do
    get :show, id: @exercise_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_log
    assert_response :success
  end

  test "should update exercise_log" do
    put :update, id: @exercise_log, exercise_log: { calories_burned: @exercise_log.calories_burned, length: @exercise_log.length }
    assert_redirected_to exercise_log_path(assigns(:exercise_log))
  end

  test "should destroy exercise_log" do
    assert_difference('ExerciseLog.count', -1) do
      delete :destroy, id: @exercise_log
    end

    assert_redirected_to exercise_logs_path
  end
end
