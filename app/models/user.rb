class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, :presence => true.
                    :length: { :maximum => 100}
                    :uniqueness => true,
                    :format => EMAIL_REGEX,
                    :confirmation => true

end
