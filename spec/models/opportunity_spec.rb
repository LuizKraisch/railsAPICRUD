require 'spec_helper'

RSpec.describe Opportunity, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:organization) }
  end
end
