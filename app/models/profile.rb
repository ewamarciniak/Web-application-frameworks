class Profile < ActiveRecord::Base
  attr_accessible :brestfeeding, :dob, :gender, :height, :pregnant, :user_id

  validates :gender, :dob, :height, :presence => true
  validates_numericality_of :height, :only_integer => true,
                            :greater_than_or_equal_to => 100,
                            :less_than_or_equal_to => 270,
                            :message => "must greater than  100 and 270[cm]."
  belongs_to :user
end