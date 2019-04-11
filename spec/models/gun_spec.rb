# frozen_string_literal: true

require "rails_helper"

RSpec.describe Gun, type: :model do
  it_behaves_like "HasCaliber"

  let(:subject) { create(:gun) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it "should have unique name scoped by caliber and user" do
      user1 = create(:user)
      user2 = create(:user)
      create(:gun, user: user1, name: "test")
      expect(build(:gun, user: user2, name: "test")).to be_valid
      expect(build(:gun, user: user1, name: "test")).not_to be_valid
    end
  end

  describe "scopes" do
    it "should have kept scope" do
      caliber1 = create(:caliber)
      caliber1.discard
      gun = create(:gun)
      gun.discard
      gun1 = create(:gun, caliber: caliber1)
      gun2 = create(:gun, caliber: create(:caliber))
      expect(described_class.kept).to include(gun2)
      expect(described_class.kept).not_to include(gun)
      expect(described_class.kept).not_to include(gun1)
    end
  end

  describe "name_full" do
    it "should be set" do
      gun = create(:gun, name: "test")
      expect(gun.name_full).to eq("test")
    end
  end

  describe "sight_height_unit" do
    it "should pull value from database" do
      user = create(:user)
      gun = create(:gun, user: user, sight_height_unit: "cm")
      user.settings(:default_units).length = "in"
      user.save!
      expect(gun.sight_height_unit).to eq("cm")
    end
    it "should pull value from user default" do
      user = create(:user)
      gun = create(:gun, user: user, sight_height_unit: "")
      user.settings(:default_units).length = "in"
      user.save!
      expect(gun.sight_height_unit).to eq("in")
    end
  end

  describe "zero_distance_unit" do
    it "should pull value from database" do
      user = create(:user)
      gun = create(:gun, user: user, zero_distance_unit: "m")
      user.settings(:default_units).distance = "yd"
      user.save!
      expect(gun.zero_distance_unit).to eq("m")
    end
    it "should pull value from user default" do
      user = create(:user)
      gun = create(:gun, user: user, zero_distance_unit: "")
      user.settings(:default_units).distance = "yd"
      user.save!
      expect(gun.zero_distance_unit).to eq("yd")
    end
  end

  describe "sight_height_full" do
    it "should return nil" do
      subject.sight_height = ""
      expect(subject.sight_height_full).to be_nil
    end
    it "shuld return full text" do
      subject.sight_height = 1.5
      expect(subject.sight_height_full).to eq("1.5 in")
    end
  end

  describe "zero_distance_full" do
    it "should return nil" do
      subject.zero_distance = ""
      expect(subject.zero_distance_full).to be_nil
    end
    it "shuld return full text" do
      subject.zero_distance = 100
      expect(subject.zero_distance_full).to eq("100 yd")
    end
  end

  describe "scope_moa_adjustment_name" do
    it "should return 1/4" do
      subject.scope_moa_adjustment = 0.25
      expect(subject.scope_moa_adjustment_name).to eq("1/4")
    end
  end
end
