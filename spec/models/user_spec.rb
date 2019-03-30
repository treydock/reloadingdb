require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:bullets) }
    it { is_expected.to have_many(:brasses) }
    it { is_expected.to have_many(:calibers) }
    it { is_expected.to have_many(:loads) }
    it { is_expected.to have_many(:powders) }
    it { is_expected.to have_many(:primers) }
    it { is_expected.to have_many(:guns) }
    it { is_expected.to have_many(:shooting_locations) }
    it { is_expected.to have_many(:shooting_logs) }
    it { is_expected.to have_many(:shooting_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
  end
end
