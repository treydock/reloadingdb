require 'rails_helper'

RSpec.describe BallisticCalculator, type: :model do
  let(:subject) { create(:ballistic_calculator) }

  describe 'validations' do
    it { is_expected.to validate_numericality_of :ballistic_coefficient }
    it { is_expected.to validate_numericality_of :velocity }
    it { is_expected.to validate_numericality_of :range }
    it { is_expected.to validate_numericality_of :height_of_sight }
    it { is_expected.to validate_numericality_of :zero_range }
  end

  describe 'RV' do
    it 'should return value' do
      expect(subject.RV.round(0)).to eq(2266)
    end
  end

  describe 'TF' do
    it 'should return value' do
      expect(subject.TF.round(3).to_s).to eq('0.237')
    end
  end

  describe 'DR' do
    it 'should return value' do
      expect(subject.DR.round(2).to_s).to eq('10.08')
    end
  end

  describe 'MH' do
    it 'should return value' do
      expect(subject.MH.round(2).to_s).to eq('2.14')
    end
  end

  describe 'EL' do
    it 'should return value for EL1' do
      expect(subject.EL(200).round(1).to_s).to eq('5.8')
    end
    it 'should return value for EL0' do
      expect(subject.EL(100).round(1).to_s).to eq('3.8')
    end
  end

  describe 'BP' do
    it 'should return value' do
      expect(subject.BP.round(1).to_s).to eq('-3.9')
    end
  end

  describe 'BP_moa' do
    it 'should return value' do
      expect(subject.BP_moa.round(1).to_s).to eq('-2.0')
    end
  end

  describe 'WD' do
    it 'should return value' do
      expect(subject.WD(10).round(1).to_s).to eq('4.4')
    end
  end

  describe 'WD_moa' do
    it 'should return value' do
      expect(subject.WD_moa(10).round(1).to_s).to eq('2.2')
    end
  end

  describe 'wind_drift_moa' do
    it 'should return value' do
      expect(subject.wind_drift_moa(10)).to eq([1.3, 2.2])
    end
  end

  describe 'wind_drift' do
    it 'should return value' do
      expect(subject.wind_drift(10)).to eq([2.7, 4.4])
    end
  end
end
