require 'spec_helper'

RSpec.describe Recruiter, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:person) }
    it { is_expected.to belongs_to(:organization) }
  end
end
