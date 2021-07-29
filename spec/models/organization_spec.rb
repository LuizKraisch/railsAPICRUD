require 'spec_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:people) }
    it { is_expected.to have_many(:opportunities) }
    it { is_expected.to have_many(:recruiters) }
    it { is_expected.to have_many(:categories) }
  end
end
