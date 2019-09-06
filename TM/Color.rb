class Color
  def initialize(args={})
    @objeto = args[:objeto];
  end
  def rgb
    raise NotImplementedError, 'Chamada de método abstrato: rgb';
  end
end



