require 'spec_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:organization) }

    it "has many categories" do
      should respond_to(:category_relation)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validates_uniqueness_of(:name) }
  end
end
