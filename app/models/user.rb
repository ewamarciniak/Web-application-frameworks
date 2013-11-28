class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :email, presence: true, uniqueness: true
  validates :email,
            :length => {:minimum => 5, :maximum => 50},
            :format => {:with =>
                            /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  validates :password,
            :length => {:minimum => 6, :maximum => 15, :on => :create}

  has_many :weight_logs
  has_many :food_intake_logs
  has_many :exercise_logs
  has_many :motivational_images
  has_one :profile
end
