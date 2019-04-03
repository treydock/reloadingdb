require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'defaults' do
    it 'should have temperature' do
      expect(subject.class.default_temperature).to eq('F')
    end
    it 'should have speed' do
      expect(subject.class.default_speed).to eq('mph')
    end
    it 'should have velocity' do
      expect(subject.class.default_velocity).to eq('fps')
    end
    it 'should have pressure' do
      expect(subject.class.default_pressure).to eq('inhg')
    end
    it 'should have length' do
      expect(subject.class.default_length).to eq('in')
    end
    it 'should have distance' do
      expect(subject.class.default_distance).to eq('yd')
    end
    it 'should have scope_adjustment' do
      expect(subject.class.default_scope_adjustment).to eq('moa')
    end
    it 'should have ballistic_coefficient' do
      expect(subject.class.default_ballistic_coefficient).to eq('lb/in^2')
    end
  end
  describe 'available units' do
    it 'should have temperature' do
      expect(subject.class.temperature).to eq(['F','C'])
    end
    it 'should have velocity' do
      expect(subject.class.velocity).to eq(['mph','kph','fps'])
    end
    it 'should have pressure' do
      expect(subject.class.pressure).to eq(['atm','mbar','psi','inhg','mmhg'])
    end
    it 'should have length' do
      expect(subject.class.length).to eq(['in','mm','cm','moa'])
    end
    it 'should have distance' do
      expect(subject.class.distance).to eq(['yd','m'])
    end
    it 'should have scope_adjustment' do
      expect(subject.class.scope_adjustment).to eq(['moa','mil','clicks','in','cm'])
    end
    it 'should have ballistic_coefficient' do
      expect(subject.class.ballistic_coefficient).to eq(['lb/in^2','kg/m^2'])
    end
  end

  describe 'scope_moa_adjustment_name' do
    it 'should return 1/4' do
      expect(subject.class.scope_moa_adjustment_name(0.25)).to eq('1/4')
    end
    it 'should return 1/8' do
      expect(subject.class.scope_moa_adjustment_name(0.125)).to eq('1/8')
    end
    it 'should return 1/2' do
      expect(subject.class.scope_moa_adjustment_name(0.5)).to eq('1/2')
    end
    it 'should return nil' do
      expect(subject.class.scope_moa_adjustment_name('')).to be_nil
    end
  end
end
