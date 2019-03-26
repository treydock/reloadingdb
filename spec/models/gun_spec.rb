require 'rails_helper'

RSpec.describe Gun, type: :model do
  let(:subject) { create(:gun) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
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
      create(:gun, user: user1, name: 'test')
      expect(build(:gun, user: user2, name: 'test')).to be_valid
      expect(build(:gun, user: user1, name: 'test')).not_to be_valid
    end
  end

  describe 'sight_height_unit' do
    it 'should pull value from database' do
      user = create(:user)
      gun = create(:gun, user: user, sight_height_unit: 'cm')
      user.settings(:default_units).length = 'in'
      user.save!
      expect(gun.sight_height_unit).to eq('cm')
    end
    it 'should pull value from user default' do
      user = create(:user)
      gun = create(:gun, user: user, sight_height_unit: '')
      user.settings(:default_units).length = 'in'
      user.save!
      expect(gun.sight_height_unit).to eq('in')
    end
  end

  describe 'zero_distance_unit' do
    it 'should pull value from database' do
      user = create(:user)
      gun = create(:gun, user: user, zero_distance_unit: 'm')
      user.settings(:default_units).distance = 'yd'
      user.save!
      expect(gun.zero_distance_unit).to eq('m')
    end
    it 'should pull value from user default' do
      user = create(:user)
      gun = create(:gun, user: user, zero_distance_unit: '')
      user.settings(:default_units).distance = 'yd'
      user.save!
      expect(gun.zero_distance_unit).to eq('yd')
    end
  end

  describe 'sight_height_full' do
    it 'should return nil' do
      subject.sight_height = ''
      expect(subject.sight_height_full).to be_nil
    end
    it 'shuld return full text' do
      subject.sight_height = 1.5
      expect(subject.sight_height_full).to eq('1.5 in')
    end
  end

  describe 'zero_distance_full' do
    it 'should return nil' do
      subject.zero_distance = ''
      expect(subject.zero_distance_full).to be_nil
    end
    it 'shuld return full text' do
      subject.zero_distance = 100
      expect(subject.zero_distance_full).to eq('100 yd')
    end
  end
end