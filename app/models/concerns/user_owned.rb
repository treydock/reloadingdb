# frozen_string_literal: true

module UserOwned
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    scope :by_user, lambda { |user|
      where(user_id: user.id)
    }

    def self.get_all_for_user(current_user, sort_by = "created_at", sort_direction = "desc")
      user = User.find(current_user.id)
      return [] unless user.present?
      self.where(user: user).order("#{sort_by} #{sort_direction}")
    end
  end
end
