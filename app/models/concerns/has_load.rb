# frozen_string_literal: true

module HasLoad
  extend ActiveSupport::Concern

  included do
    include HasSearch

    belongs_to :load

    scoped_search on: :bullet, ext_method: :find_by_bullet_name
    scoped_search on: :bullet_grain, ext_method: :find_by_bullet_grain
    scoped_search on: :powder, ext_method: :find_by_powder_name

    private

      def self.search_by_load(key, operator, value, assoc, attr)
        conditions = sanitize_sql_for_conditions(["#{assoc}s.#{attr} #{operator} ?", value_search(value, operator)])
        loads = Load.joins(assoc.to_sym).where(conditions).map(&:id)
        { conditions: "#{self.table_name}.load_id IN(#{loads.join(',')})" }
      end

      def self.find_by_bullet_name(key, operator, value)
        search_by_load(key, operator, value, "bullet", "name")
      end

      def self.find_by_bullet_grain(key, operator, value)
        search_by_load(key, operator, value, "bullet", "grain")
      end

      def self.find_by_powder_name(key, operator, value)
        search_by_load(key, operator, value, "powder", "name")
      end
  end
end
