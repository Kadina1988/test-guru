class Boo
  attr_accessor :mass, :priz
  def initialize
    @mass = []
    @priz = []
  end

  def porv
    if @mass.count  ==  2 #&& @priz.empty?
      @priz << Badge.new('first')
      @mass = []
    else
      # again_prov
    end
  end

  def again_prov
    @mass = []
    if @mass.count == 2
      @priz << Badge.new('Second')
    end
  end
end

class Badge
  def initialize(name)
    @name = name
  end
end
