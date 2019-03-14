require 'rails_helper'

RSpec.describe Load, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
    it { is_expected.to belong_to(:brass) }
    it { is_expected.to belong_to(:bullet) }
    it { is_expected.to belong_to(:powder) }
    it { is_expected.to belong_to(:primer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of(:powder_weight) }
    it { is_expected.to validate_presence_of(:powder_weight) }
    it { is_expected.to validate_numericality_of(:col) }
    it { is_expected.to validate_presence_of(:col) }
    it { is_expected.to validate_numericality_of(:brass_length) }
    it { is_expected.to validate_numericality_of(:brass_uses).only_integer }
    it { is_expected.to validate_numericality_of(:speed).only_integer }
    it { is_expected.to validate_numericality_of(:run_out) }
    it { is_expected.to validate_numericality_of(:rounds).only_integer }
  end

  describe 'brass_length_unit' do
    it 'should pull value from database' do
      user = create(:user)
      load = create(:load, user: user, brass_length_unit: 'in')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.brass_length_unit).to eq('in')
    end
    it 'should pull value from user default' do
      user = create(:user)
      load = create(:load, user: user, brass_length_unit: '')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.brass_length_unit).to eq('cm')
    end
  end

  describe 'col_unit' do
    it 'should pull value from database' do
      user = create(:user)
      load = create(:load, user: user, col_unit: 'in')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.col_unit).to eq('in')
    end
    it 'should pull value from user default' do
      user = create(:user)
      load = create(:load, user: user, col_unit: '')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.col_unit).to eq('cm')
    end
  end

  describe 'run_out_unit' do
    it 'should pull value from database' do
      user = create(:user)
      load = create(:load, user: user, run_out_unit: 'in')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.run_out_unit).to eq('in')
    end
    it 'should pull value from user default' do
      user = create(:user)
      load = create(:load, user: user, run_out_unit: '')
      user.settings(:default_units).length = 'cm'
      user.save!
      expect(load.run_out_unit).to eq('cm')
    end
  end

  describe 'speed_unit' do
    it 'should pull value from database' do
      user = create(:user)
      load = create(:load, user: user, speed_unit: 'mph')
      user.settings(:default_units).length = 'kph'
      user.save!
      expect(load.speed_unit).to eq('mph')
    end
    it 'should pull value from user default' do
      user = create(:user)
      load = create(:load, user: user, speed_unit: '')
      user.settings(:default_units).speed = 'kph'
      user.save!
      expect(load.speed_unit).to eq('kph')
    end
  end
end
