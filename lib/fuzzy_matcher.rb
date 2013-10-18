require "fuzzy_matcher/version"

module FuzzyMatcher
  def self.equals?(obj1, obj2)
    if obj1.is_a?(Array) && obj2.is_a?(Array)
      obj1.sort == obj2.sort
    elsif obj1.is_a?(Hash) && obj2.is_a?(Hash)
      return false if !equals?(obj1.keys, obj2.keys)

      obj1.keys.each do |key|
        return false if !equals?(obj1[key], obj2[key])
      end

      true
    else
      obj1 == obj2
    end
  end
end
