require 'rails_helper'

RSpec.describe Bullet, type: :model do
  it_behaves_like 'HasCaliber'

  let(:subject) { create(:bullet) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :grain }
    it { is_expected.to validate_numericality_of :ballistic_coefficient }
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

  describe 'name_caliber_grain' do
    it 'should be set' do
      caliber = create(:caliber, name: '308')
      bullet = create(:bullet, caliber: caliber, name: 'Sierra HPBT', grain: 168)
      expect(bullet.name_caliber_grain).to eq('Sierra HPBT (308 - 168gr)')
    end
  end

  describe 'ballistic_coefficient_full' do
    it 'should return ballistic_coefficient' do
      subject.ballistic_coefficient = ''
      expect(subject.ballistic_coefficient_full).to be_nil
    end
    it 'shuld return full text' do
      subject.ballistic_coefficient = 2.0
      expect(subject.ballistic_coefficient_full).to eq('2.0 lb/in^2')
    end
  end

  describe 'ballistic_coefficient_unit' do
    it 'should pull value from database' do
      user = create(:user)
      bullet = create(:bullet, user: user, ballistic_coefficient_unit: 'kb/m^2')
      user.settings(:default_units).ballistic_coefficient = 'lb/in^2'
      user.save!
      expect(bullet.ballistic_coefficient_unit).to eq('kb/m^2')
    end
    it 'should pull value from user default' do
      user = create(:user)
      bullet = create(:bullet, user: user, ballistic_coefficient_unit: '')
      user.settings(:default_units).ballistic_coefficient = 'lb/in^2'
      user.save!
      expect(bullet.ballistic_coefficient_unit).to eq('lb/in^2')
    end
  end
end
