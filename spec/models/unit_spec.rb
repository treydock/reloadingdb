require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'defaults' do
    it 'should have temperature' do
      expect(subject.class.default_temperature).to eq('F')
    end
    it 'should have velocity' do
      expect(subject.class.default_velocity).to eq('mph')
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
  end
  describe 'available units' do
    it 'should have temperature' do
      expect(subject.class.temperature).to eq(['F','C'])
    end
    it 'should have velocity' do
      expect(subject.class.velocity).to eq(['mph','kph'])
    end
    it 'should have pressure' do
      expect(subject.class.pressure).to eq(['atm','mbar','psi','inhg','mmhg'])
    end
    it 'should have length' do
      expect(subject.class.length).to eq(['in','mm','cm'])
    end
    it 'should have distance' do
      expect(subject.class.distance).to eq(['yd','m'])
    end
    it 'should have scope_adjustment' do
      expect(subject.class.scope_adjustment).to eq(['moa','mil','clicks','in','cm'])
    end
  end
end
