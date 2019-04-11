# frozen_string_literal: true

module HasCaliber
  extend ActiveSupport::Concern

  included do
    belongs_to :caliber

    scoped_search relation: :caliber, on: :name, complete_value: true, rename: :caliber
  end
end
