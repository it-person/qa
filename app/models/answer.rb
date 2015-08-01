class Answer < ActiveRecord::Base
  belongs_to :question
  validates :body, presence: true, length: {in: 3..1000}
  validates :question_id, presence: true
end
