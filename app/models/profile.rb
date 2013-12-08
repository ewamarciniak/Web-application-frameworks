class Profile < ActiveRecord::Base
  attr_accessible :brestfeeding, :dob, :gender, :height, :pregnant, :user_id

  validates :gender, :dob,:height, :presence => true
  belongs_to :user

end
