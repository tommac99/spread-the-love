class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX =  /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email, :presence => true,
                    :length: { :maximum => 100},
                    :uniqueness => true,
                    :format => EMAIL_REGEX,
                    :confirmation => true

  validates :first_name,  :presence => true,
                          :length: { :maximum => 25 }
  
  validates :last_name, :presence => true,
                        :length: { :maximum => 50 }

  validates :email, :presence => true,
                    :length: { :within => 8..25 },
                    :uniqueness => true

end
