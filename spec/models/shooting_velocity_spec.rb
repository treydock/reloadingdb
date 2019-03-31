require 'rails_helper'

RSpec.describe ShootingVelocity, type: :model do
  let(:subject) { create(:shooting_velocity) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:caliber) }
    it { is_expected.to belong_to(:load) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
  end

  describe 'velocities' do
    it 'should accept array of integers' do
      subject.velocities = [1000,1000]
      subject.save!
      subject.reload
      expect(subject.velocities).to eq([1000,1000])
    end
    it 'should remove blank values' do
      subject.velocities = [1000,'']
      subject.save!
      subject.reload
      expect(subject.velocities).to eq([1000])
    end
    it 'should be invalid if not integers' do
      obj = build(:shooting_velocity, velocities: ['foo',2000])
      expect(obj).not_to be_valid
    end
  end

  describe 'average_velocity' do
    it 'should calculate average' do
      obj = create(:shooting_velocity, velocities: [1000,2000])
      expect(obj.average_velocity).to eq(1500)
    end
    it 'should handle empty array' do
      obj = create(:shooting_velocity, velocities: [])
      expect(obj.average_velocity).to be_nil
    end
    it 'should handle nil' do
      obj = create(:shooting_velocity, velocities: nil)
      expect(obj.average_velocity).to be_nil
    end
  end

  describe 'velocity_unit' do
    it 'should pull value from database' do
      user = create(:user)
      object = create(:shooting_velocity, user: user, velocity_unit: 'mph')
      user.settings(:default_units).velocity = 'fps'
      user.save!
      expect(object.velocity_unit).to eq('mph')
    end
    it 'should pull value from user default' do
      user = create(:user)
      object = create(:shooting_velocity, user: user, velocity_unit: '')
      user.settings(:default_units).velocity = 'fps'
      user.save!
      expect(object.velocity_unit).to eq('fps')
    end
  end

end
