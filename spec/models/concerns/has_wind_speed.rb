# frozen_string_literal: true

require "rails_helper"

shared_examples_for "HasWindSpeed" do
  let(:model) { described_class }
  let(:name) { model.to_s.underscore.to_sym }
  let(:subject) { create(name) }

  describe "wind_direction validations" do
    it "validates absent" do
      subject.wind_speed = nil
      is_expected.to validate_absence_of(:wind_direction)
    end
    it "does not validate absent" do
      subject.wind_speed = 10
      is_expected.not_to validate_absence_of(:wind_direction)
    end
  end

  describe "wind_speed_full" do
    it "returns wind_speed if nil" do
      subject.wind_speed = nil
      expect(subject.wind_speed_full).to be_nil
    end
    it "returns full value" do
      subject.wind_speed = 10
      subject.wind_direction = 90
      expect(subject.wind_speed_full).to eq("10 mph (90#{176.chr(Encoding::UTF_8)})")
    end
  end

  describe "wind_speed_unit" do
    it "should pull value from database" do
      user = create(:user)
      object = create(name, user: user, wind_speed_unit: "kph")
      user.settings(:default_units).speed = "mph"
      user.save!
      expect(object.wind_speed_unit).to eq("kph")
    end
    it "should pull value from user default" do
      user = create(:user)
      object = create(name, user: user, wind_speed_unit: "")
      user.settings(:default_units).speed = "mph"
      user.save!
      expect(object.wind_speed_unit).to eq("mph")
    end
  end
end
