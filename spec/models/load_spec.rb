require 'rails_helper'

RSpec.describe Load, type: :model do
  it_behaves_like 'HasCaliber'
  it_behaves_like 'HasVelocity'

  let(:subject) { create(:load) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:brass) }
    it { is_expected.to belong_to(:bullet) }
    it { is_expected.to belong_to(:powder) }
    it { is_expected.to belong_to(:primer) }
    it { is_expected.to have_many(:shooting_groups) }
    it { is_expected.to have_many(:shooting_velocities) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of(:powder_weight) }
    it { is_expected.to validate_presence_of(:powder_weight) }
    it { is_expected.to validate_numericality_of(:col) }
    it { is_expected.to validate_presence_of(:col) }
    it { is_expected.to validate_numericality_of(:brass_length) }
    it { is_expected.to validate_numericality_of(:brass_uses).only_integer }
    it { is_expected.to validate_numericality_of(:run_out) }
    it { is_expected.to validate_numericality_of(:rounds).only_integer }
  end

  describe 'name' do
    it 'should be set' do
      caliber = create(:caliber, name: '308')
      bullet = create(:bullet, caliber: caliber, name: 'Sierra HPBT', grain: 168)
      powder = create(:powder, name: 'test')
      load = create(:load, caliber: caliber, bullet: bullet, powder: powder, powder_weight: 40, date: Date.parse('2019-03-14'))
      expect(load.name).to eq('2019-03-14 - Sierra HPBT (308 - 168gr) - test (40.0gr)')
    end
  end

  describe 'brass_length_full' do
    it 'should return brass_length' do
      subject.brass_length = ''
      expect(subject.brass_length_full).to be_nil
    end
    it 'shuld return full text' do
      subject.brass_length = 2.0
      expect(subject.brass_length_full).to eq('2.0 in')
    end
  end

  describe 'col_full' do
    it 'should return col' do
      subject.col = ''
      expect(subject.col_full).to be_nil
    end
    it 'shuld return full text' do
      subject.col = 2.0
      expect(subject.col_full).to eq('2.0 in')
    end
  end

  describe 'run_out_full' do
    it 'should return run_out' do
      subject.run_out = ''
      expect(subject.run_out_full).to be_nil
    end
    it 'shuld return full text' do
      subject.run_out = 2.0
      expect(subject.run_out_full).to eq('2.0 in')
    end
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
end
