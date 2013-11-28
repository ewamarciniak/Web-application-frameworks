class Profile < ActiveRecord::Base
  attr_accessible :brestfeeding, :dob, :gender, :height, :pregnant, :user_id

  validates :gender, :presence => true
  validates :dob, :presence => true
  belongs_to :user
end
