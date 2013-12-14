module ApplicationHelper

  #calculates the minimum BMI healthy weight in kg
  def min_bmi_normal
    height = current_user.profile.height/100.0 # in metres
    max_bmi = 18.5
    return (max_bmi*(height**2)).round(2)
  end

  #calculates the maximum BMI healthy weight in kg
  def max_bmi_normal
    height = current_user.profile.height/100.0 # in metres
    max_bmi = 24.9
    return (max_bmi*(height**2)).round(2)
  end

  #allows columns sorting
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  #returns data on user's food intake during past 4 weeks for nutritional advice
  def relevant_food_intake_logs
    FoodIntakeLog.where(user_id: current_user.id, intake_date: 4.week.ago.beginning_of_day..Time.zone.now)
  end

  #returns data on user's exercise during past 4 weeks for nutritional advice
  def relevant_exercise_logs
    ExerciseLog.joins(:user).where(user_id: current_user.id, exercise_date: 1.week.ago.beginning_of_day..Time.zone.now)
  end

  #returns data on users food intake during past 4 weeks for nutritional advice
  def gender
    Profile.where(user_id: current_user.id).first.gender
  end

  #returns nutritional advice on calories intake
  def calories_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      calories_eaten = 0
      calories_burned = 0

      relevant_food_intake_logs.each do |food_log|
        calories_eaten += food_log.calories * 1.0
      end
      unless relevant_exercise_logs.empty?
        relevant_exercise_logs.each do |exercise_log|
          calories_burned += exercise_log.calories_burned * 1.0
        end
      end

      #check the balance of burned calories and eaten calories
      calories = calories_burned ? calories_eaten - calories_burned : calories_eaten
      advice = Checknutritious.check_calories(calories, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on protein intake
  def protein_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      protein = 0

      relevant_food_intake_logs.each do |food_log|
        protein += food_log.protein * 1.0
      end
      advice = Checknutritious.check_protein_intake(protein, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on carbs intake
  def carbohydrates_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      carbohydrates = 0

      relevant_food_intake_logs.each do |food_log|
        carbohydrates += food_log.carbohydrates * 1.0
      end
      advice = Checknutritious.check_carbohydrates_intake(carbohydrates, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on sugars intake
  def sugars_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      sugars = 0

      relevant_food_intake_logs.each do |food_log|
        sugars += food_log.sugars * 1.0
      end
      advice = Checknutritious.check_sugars_intake(sugars, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on saturated fats intake
  def saturated_fats_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      saturated_fats = 0

      relevant_food_intake_logs.each do |food_log|
        saturated_fats += food_log.saturated_fats * 1.0
      end
      advice = Checknutritious.check_saturated_fats_intake(saturated_fats, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on unsaturated fats intake
  def unsaturated_fats_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      unsaturated_fats = 0

      relevant_food_intake_logs.each do |food_log|
        unsaturated_fats += food_log.unsaturated_fats * 1.0
      end
      advice = Checknutritious.check_unsaturated_fats_intake(unsaturated_fats, no_of_days, gender)
      return advice
    end
  end

  #returns nutritional advice on fibre intake
  def fibre_advice
    #if gender info not submitted
    if gender.nil?
      return "We don't have enough of data to give nutritional advice. Please make sure you select your gender in the Profile section ."
    #if gender info submitted but there are no relevant logs from last 4 weeks
    elsif  relevant_food_intake_logs.empty?
      return "We don't have enough of data to give nutritional advice. Please make sure you have logged your all food intake and exercise"
    else
      no_of_days = relevant_food_intake_logs.group("date(intake_date)").size.size
      fibre = 0

      relevant_food_intake_logs.each do |food_log|
        fibre += food_log.fibre * 1.0
      end
      advice = Checknutritious.check_fibre_intake(fibre, no_of_days, gender)
      return advice
    end
  end
end
