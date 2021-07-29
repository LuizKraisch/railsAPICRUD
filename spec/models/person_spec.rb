require 'spec_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:organization) }
    it { is_expected.to has_many(:graduations) }
  end
end
