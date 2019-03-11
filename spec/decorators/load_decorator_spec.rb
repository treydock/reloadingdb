require 'rails_helper'

RSpec.describe LoadDecorator do
  let(:caliber) { create(:caliber, name: '308') }
  let(:brass) { create(:brass, name: 'test', caliber: caliber).decorate }
  let(:bullet) { create(:bullet, name: 'test', grain: 168, caliber: caliber).decorate }
  let(:load) { create(:load, caliber: caliber, brass: brass, bullet: bullet) }

  it 'decorates brass' do
    expect(load.brass).to be_decorated
  end

  it 'decorates bullet' do
    expect(load.bullet).to be_decorated
  end
end
