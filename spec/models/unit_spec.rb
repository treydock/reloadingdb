require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'units' do
    it 'should have temperature' do
      expect(subject.class.temperature).to eq(['F','C'])
    end
    it 'should have speed' do
      expect(subject.class.speed).to eq(['mph','kph'])
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
  end
end
