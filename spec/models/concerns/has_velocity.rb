require 'rails_helper'

shared_examples_for 'HasVelocity' do
  let(:model) { described_class }
  let(:name) { model.to_s.underscore.to_sym }
  let(:subject) { create(name) }

  describe 'velocity validations' do
    it { is_expected.to validate_numericality_of(:velocity).only_integer }
  end

  describe 'velocity_full' do
    it 'returns velocity if nil' do
      subject.velocity = nil
      expect(subject.velocity_full).to be_nil
    end
    it 'returns full value' do
      subject.velocity = 2000
      expect(subject.velocity_full).to eq("2000 fps")
    end
  end

  describe 'velocity_unit' do
    it 'should pull value from database' do
      user = create(:user)
      object = create(name, user: user, velocity_unit: 'mph')
      user.settings(:default_units).velocity = 'fps'
      user.save!
      expect(object.velocity_unit).to eq('mph')
    end
    it 'should pull value from user default' do
      user = create(:user)
      object = create(name, user: user, velocity_unit: '')
      user.settings(:default_units).velocity = 'fps'
      user.save!
      expect(object.velocity_unit).to eq('fps')
    end
  end
end
