require 'rails_helper'

RSpec.describe BulletDecorator do
  let(:caliber) { create(:caliber, name: '308') }
  let(:bullet) { create(:bullet, name: 'test', grain: 168, caliber: caliber).decorate }

  it 'has name_grain_caliber' do
    expect(bullet.name_grain_caliber).to eq('test (308 - 168gr)')
  end
end
