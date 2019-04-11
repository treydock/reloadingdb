require 'rails_helper'

RSpec.describe Powder, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:loads).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it 'should have unique name scoped by caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      create(:powder, user: user1, name: 'test')
      expect(build(:powder, user: user2, name: 'test')).to be_valid
      expect(build(:powder, user: user1, name: 'test')).not_to be_valid
    end
  end

  describe 'name_full' do
    it 'should be set' do
      powder = create(:powder, name: 'test')
      expect(powder.name_full).to eq('test')
    end
  end
end
