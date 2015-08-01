require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to have_many :answers }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { is_expected.to validate_length_of(:title).is_at_most(256) }
end
