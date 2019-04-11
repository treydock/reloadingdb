# frozen_string_literal: true

module ViewHelpers
  extend ActiveSupport::Concern
  included do
    before(:each) do
      view.lookup_context.prefixes << "application"
    end
  end
end
