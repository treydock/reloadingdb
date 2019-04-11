# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShootingLocation, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:shooting_logs).dependent(:nullify) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it "should have unique name scoped by user" do
      user1 = create(:user)
      user2 = create(:user)
      create(:shooting_location, user: user1, name: "test")
      expect(build(:shooting_location, user: user2, name: "test")).to be_valid
      expect(build(:shooting_location, user: user1, name: "test")).not_to be_valid
    end
  end

  describe "name_full" do
    it "should be set" do
      shooting_location = create(:shooting_location)
      expect(shooting_location.name_full).to eq(shooting_location.name)
    end
  end
end
