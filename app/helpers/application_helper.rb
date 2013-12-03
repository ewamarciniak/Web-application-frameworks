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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end
