class ArrayOfIntegersSerializer
  def self.load(value)
    JSON.load(value)
  end

  def self.dump(value)
    value.reject!(&:blank?)
    begin
      value.map!(&:to_i)
    rescue
      raise ::ActiveRecord::SerializationTypeMismatch, "Unable to convert to integers -- #{value.inspect}"
    end
    JSON.dump(value)
  end
end
