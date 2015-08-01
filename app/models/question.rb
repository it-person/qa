# Question model
class Question < ActiveRecord::Base
  has_many :answers
  validates :title, presence: true, length: { in: 3..256 }
end
