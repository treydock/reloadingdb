class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Discard::Model

  def will_destroy
    has_many = self.class.reflect_on_all_associations(:has_many).map(&:name)
    result = {}
    has_many.each do |h|
      records = self.send(h)
      result[h] = records
    end
    result
  end

  def discarded_associations
    belongs_to = self.class.reflect_on_all_associations(:belongs_to).map(&:name)
    discarded = {}
    belongs_to.each do |b|
      r = self.send(b)
      if r.discarded?
        discarded[b] = r
      end
    end
    discarded
  end
end
