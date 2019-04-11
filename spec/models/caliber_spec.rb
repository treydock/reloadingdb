require 'rails_helper'

RSpec.describe Caliber, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:bullets).dependent(:destroy) }
    it { is_expected.to have_many(:brasses).dependent(:destroy) }
    it { is_expected.to have_many(:loads).dependent(:destroy) }
    it { is_expected.to have_many(:guns).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_logs).dependent(:nullify) }
    it { is_expected.to have_many(:shooting_groups).dependent(:destroy) }
    it { is_expected.to have_many(:shooting_velocities).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it 'should have unique name scoped by caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      create(:caliber, user: user1, name: 'test')
      expect(build(:caliber, user: user2, name: 'test')).to be_valid
      expect(build(:caliber, user: user1, name: 'test')).not_to be_valid
    end
  end

  describe 'name_full' do
    it 'should be set' do
      caliber = create(:caliber, name: 'test')
      expect(caliber.name_full).to eq('test')
    end
  end
end
