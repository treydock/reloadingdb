class ArrayOfIntegersSerializer
  def self.load(value)
    JSON.load(value)
  end

  def self.dump(value)
    value.reject!(&:blank?)
    values = []
    value.each do |v|
      if v.to_i.to_s == v.to_s
        values << v.to_i
      else
        values << v
      end
    end
    JSON.dump(values)
  end
end
