class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  CATEGORY = %w[Help Volunteering Donations Paid Trade].freeze
  validates :category, inclusion: { in: CATEGORY }
  validates :group, inclusion: { in: ["Community post", "Job post"] }
end


