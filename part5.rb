class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
        if #{attr_name}.nil?
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history.push(value)
        @#{attr_name} = value
      end
    } 
  end
end

class Foo
  attr_accessor_with_history :bar
end

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      return self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    currency = currency.to_s.gsub( /s$/i, '')
    return self / @@currencies[currency] if @@currencies.has_key?(currency)
  end
end

class String
  def palindrome?
    string = self.to_s
    string = string.gsub(/\W+/, '').downcase
    string == string.reverse
  end
end

module Enumerable
  def palindrome?
    self.each_with_index do |elt, i|
      return false unless elt == self.entries.slice(-(i + 1))
    end
    true
  end
end
