class CartesianProduct
  include Enumerable
  def initialize(c1,c2)
  	@c1 = c1
  	@c2 = c2
  end
  
  def each
    @c1.each do |e1|
      @c2.each do |e2|
        yield([e1, e2])
      end
    end 
  end
end
