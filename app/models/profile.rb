class Profile < ActiveRecord::Base
  attr_accessible :brestfeeding, :dob, :gender, :height, :pregnant, :user_id

  validates :gender, :dob, :height, :presence => true
  validates :height, numericality: true
  belongs_to :user
end