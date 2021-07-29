require 'spec_helper'

RSpec.describe CategoryRelation, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:organization) }
    it { is_expected.to belongs_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validates_uniqueness_of(:category_id).scoped_to(:resource_id, :resource_type) }
  end
end
