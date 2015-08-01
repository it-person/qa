require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to :question }
  it { is_expected.to validate_presence_of :question_id }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_length_of(:body).is_at_least(3).is_at_most(1000)  }
end