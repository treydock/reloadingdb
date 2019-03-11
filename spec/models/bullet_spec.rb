require 'rails_helper'

RSpec.describe Bullet, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :grain }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to([:caliber, :user])
    end
    it 'should have unique name scoped by caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      caliber1 = create(:caliber, user: user1)
      caliber2 = create(:caliber, user: user2)
      create(:bullet, user: user1, caliber: caliber1, name: 'test')
      expect(build(:bullet, user: user2, caliber: caliber2, name: 'test')).to be_valid
      expect(build(:bullet, user: user1, caliber: caliber1, name: 'test')).not_to be_valid
    end
  end
end
