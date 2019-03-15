require 'rails_helper'

RSpec.describe ShootingGroup, type: :model do
  it_behaves_like 'HasWindSpeed'
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
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

  describe 'wind_speed_unit' do
    it 'should pull value from database' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, wind_speed_unit: 'kph')
      user.settings(:default_units).speed = 'mph'
      user.save!
      expect(shooting_log.wind_speed_unit).to eq('kph')
    end
    it 'should pull value from user default' do
      user = create(:user)
      shooting_log = create(:shooting_group, user: user, wind_speed_unit: '')
      user.settings(:default_units).speed = 'mph'
      user.save!
      expect(shooting_log.wind_speed_unit).to eq('mph')
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

  describe 'velocity_unit' do
    it 'should pull value from database' do
      user = create(:user)
      load = create(:shooting_group, user: user, velocity_unit: 'mph')
      user.settings(:default_units).speed = 'kph'
      user.save!
      expect(load.velocity_unit).to eq('mph')
    end
    it 'should pull value from user default' do
      user = create(:user)
      load = create(:shooting_group, user: user, velocity_unit: '')
      user.settings(:default_units).speed = 'kph'
      user.save!
      expect(load.velocity_unit).to eq('kph')
    end
  end
end
