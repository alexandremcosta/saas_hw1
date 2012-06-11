class Dessert
  attr_accessor :name, :calories
  
  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end
  
  def healthy?
    if self.calories < 200
      true
    else
      false
    end
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  
  def initialize(name, calories, flavor)
    super(name, calories)
    self.flavor = flavor.to_s
  end
  
  def delicious?
    if self.flavor =~ /^black licorice$/i
      false
    else
      super
    end
  end
end
