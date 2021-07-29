require 'spec_helper'

RSpec.describe Graduation, type: :model do
  describe 'associations' do
    it { is_expected.to belongs_to(:person) }
  end
end
