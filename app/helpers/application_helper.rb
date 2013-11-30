module ApplicationHelper

  def min_bmi_normal
    height =  current_user.profile.height/100.0
    max_bmi = 18.5
    return (max_bmi*(height**2)).round(2)
  end

  def max_bmi_normal
    height =  current_user.profile.height/100.0
    max_bmi = 24.9
    return (max_bmi*(height**2)).round(2)
  end

end
