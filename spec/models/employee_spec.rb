require 'spec_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:person) }
  end
end
