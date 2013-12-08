class MotivationalImage < ActiveRecord::Base
  attr_accessible :caption, :user_id, :picture
  has_attached_file :picture, :styles => { :large => "500x700>", :medium => "300x400>", :thumb => "100x140>" }
  validates_attachment :picture, :presence => true,
                       :size => {:in => 0..500.kilobytes}
  validates :user_id, :presence => true

  belongs_to :user

end
