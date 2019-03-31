require 'rails_helper'

RSpec.describe ShootingGroup, type: :model do
  it_behaves_like 'HasWindSpeed'

  let(:subject) { create(:shooting_group) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
    it { is_expected.to belong_to(:load) }
    it { is_expected.to belong_to(:shooting_log) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :distance }
    it { is_expected.to validate_numericality_of(:distance).only_integer }
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_numericality_of(:number).only_integer }
    describe 'elevation_adjustment_direction' do
      it 'validates absent' do
        subject.elevation_adjustment = nil
        is_expected.to validate_absence_of(:elevation_adjustment_direction)
      end
      it 'does not validate absent' do
        subject.elevation_adjustment = 4
        is_expected.not_to validate_absence_of(:elevation_adjustment_direction)
      end
    end
    describe 'windage_adjustment_direction' do
      it 'validates absent' do
        subject.windage_adjustment = nil
        is_expected.to validate_absence_of(:windage_adjustment_direction)
      end
      it 'does not validate absent' do
        subject.windage_adjustment = 4
        is_expected.not_to validate_absence_of(:windage_adjustment_direction)
      end
    end
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to([:shooting_log, :caliber, :user])
    end
    it 'should have unique name scoped by shooting_log, caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      caliber1 = create(:caliber, user: user1)
      caliber2 = create(:caliber, user: user2)
      shooting_log1_user1 = create(:shooting_log, user: user1)
      shooting_log2_user1 = create(:shooting_log, user: user1)
      shooting_log1_user2 = create(:shooting_log, user: user2)
      shooting_log2_user2 = create(:shooting_log, user: user2)
      create(:shooting_group, user: user1, caliber: caliber1, shooting_log: shooting_log1_user1, number: 1)
      expect(build(:shooting_group, user: user1, caliber: caliber1, shooting_log: shooting_log1_user1, number: 2)).to be_valid
      expect(build(:shooting_group, user: user1, caliber: caliber1, shooting_log: shooting_log1_user1, number: 1)).not_to be_valid
      expect(build(:shooting_group, user: user1, caliber: caliber2, shooting_log: shooting_log1_user1, number: 1)).to be_valid
      expect(build(:shooting_group, user: user2, caliber: caliber1, shooting_log: shooting_log1_user2, number: 1)).to be_valid
    end
  end

  describe 'name' do
    it 'should be set' do
      shooting_log = create(:shooting_log, date: Date.parse('2019-03-14'))
      shooting_group = create(:shooting_group, shooting_log: shooting_log, number: 1, distance: 100, distance_unit: 'yd')
      expect(shooting_group.name).to eq('2019-03-14 - #1 (100 yd)')
    end
  end

  describe 'distance_unit' do
    it 'should pull value from database' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, distance_unit: 'm')
      user.settings(:default_units).distance = 'yd'
      user.save!
      expect(shooting_log.distance_unit).to eq('m')
    end
    it 'should pull value from user default' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, distance_unit: '')
      user.settings(:default_units).distance = 'yd'
      user.save!
      expect(shooting_log.distance_unit).to eq('yd')
    end
  end

  describe 'elevation_adjustment_unit' do
    it 'should pull value from database' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, elevation_adjustment_unit: 'mil')
      user.settings(:default_units).scope_adjustment = 'moa'
      user.save!
      expect(shooting_log.elevation_adjustment_unit).to eq('mil')
    end
    it 'should pull value from user default' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, elevation_adjustment_unit: '')
      user.settings(:default_units).scope_adjustment = 'moa'
      user.save!
      expect(shooting_log.elevation_adjustment_unit).to eq('moa')
    end
  end

  describe 'windage_adjustment_unit' do
    it 'should pull value from database' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, windage_adjustment_unit: 'mil')
      user.settings(:default_units).scope_adjustment = 'moa'
      user.save!
      expect(shooting_log.windage_adjustment_unit).to eq('mil')
    end
    it 'should pull value from user default' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, windage_adjustment_unit: '')
      user.settings(:default_units).scope_adjustment = 'moa'
      user.save!
      expect(shooting_log.windage_adjustment_unit).to eq('moa')
    end
  end

  describe 'group_size_unit' do
    it 'should pull value from database' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, group_size_unit: 'cm')
      user.settings(:default_units).length = 'in'
      user.save!
      expect(shooting_log.group_size_unit).to eq('cm')
    end
    it 'should pull value from user default' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, group_size_unit: '')
      user.settings(:default_units).length = 'in'
      user.save!
      expect(shooting_log.group_size_unit).to eq('in')
    end
  end

  describe 'distance_full' do
    it 'should return temperature' do
      subject.distance = ''
      expect(subject.distance_full).to be_nil
    end
    it 'shuld return full text' do
      subject.distance = 100
      expect(subject.distance_full).to eq('100 yd')
    end
  end

  describe 'elevation_adjustment_full' do
    it 'should return temperature' do
      subject.elevation_adjustment = ''
      expect(subject.elevation_adjustment_full).to be_nil
    end
    it 'shuld return full text' do
      subject.elevation_adjustment = 4
      subject.elevation_adjustment_direction = 'up'
      expect(subject.elevation_adjustment_full).to eq('4.0 moa up')
    end
  end

  describe 'windage_adjustment_full' do
    it 'should return temperature' do
      subject.windage_adjustment = ''
      expect(subject.windage_adjustment_full).to be_nil
    end
    it 'shuld return full text' do
      subject.windage_adjustment = 4
      subject.windage_adjustment_direction = 'left'
      expect(subject.windage_adjustment_full).to eq('4.0 moa left')
    end
  end

  describe 'group_size_full' do
    it 'should return temperature' do
      subject.group_size = ''
      expect(subject.group_size_full).to be_nil
    end
    it 'shuld return full text' do
      subject.group_size = 1.0
      expect(subject.group_size_full).to eq('1.0 in')
    end
  end
end
