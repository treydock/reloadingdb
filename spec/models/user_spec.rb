require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:bullets).dependent(:destroy) }
    it { is_expected.to have_many(:brasses).dependent(:destroy) }
    it { is_expected.to have_many(:calibers).dependent(:destroy) }
    it { is_expected.to have_many(:loads).dependent(:destroy) }
    it { is_expected.to have_many(:powders).dependent(:destroy) }
    it { is_expected.to have_many(:primers).dependent(:destroy) }
    it { is_expected.to have_many(:guns).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_locations).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_logs).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_groups).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_velocities).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
  end
end
