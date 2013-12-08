class Recipe < ActiveRecord::Base
  attr_accessible :calories_per_portion, :cooking_time, :directions, \
  :number_of_portions, :preparation_time, :shopping_list, :title, :ingredient_ids, :picture
  has_and_belongs_to_many :ingredients
  has_attached_file :picture, :styles => { :large => "500x500>", :medium => "250x250>", :thumb => "100x100>" }


  def ready_in_time
    return self.preparation_time + self.cooking_time
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
