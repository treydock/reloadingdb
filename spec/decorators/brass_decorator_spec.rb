require 'rails_helper'

RSpec.describe BrassDecorator do
  let(:caliber) { create(:caliber, name: '308') }
  let(:brass) { create(:brass, name: 'test', caliber: caliber).decorate }

  it 'has name_caliber' do
    expect(brass.name_caliber).to eq('test (308)')
  end
end
