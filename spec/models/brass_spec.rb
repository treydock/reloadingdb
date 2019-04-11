require 'rails_helper'

RSpec.describe Brass, type: :model do
  it_behaves_like 'HasCaliber'

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:loads).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to([:caliber, :user])
    end
    it 'should have unique name scoped by caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      caliber1 = create(:caliber, user: user1)
      caliber2 = create(:caliber, user: user2)
      create(:brass, user: user1, caliber: caliber1, name: 'test')
      expect(build(:brass, user: user2, caliber: caliber2, name: 'test')).to be_valid
      expect(build(:brass, user: user1, caliber: caliber1, name: 'test')).not_to be_valid
    end
  end

  describe 'scopes' do
    it 'should have kept scope' do
      caliber1 = create(:caliber)
      caliber1.discard
      brass = create(:brass)
      brass.discard
      brass1 = create(:brass, caliber: caliber1)
      brass2 = create(:brass, caliber: create(:caliber))
      expect(described_class.kept).to include(brass2)
      expect(described_class.kept).not_to include(brass)
      expect(described_class.kept).not_to include(brass1)
    end
  end

  describe 'name_full' do
    it 'should have full name' do
      brass = create(:brass, name: 'test', caliber: create(:caliber, name: '308'))
      expect(brass.name_full).to eq('test (308)')
    end
  end
end
