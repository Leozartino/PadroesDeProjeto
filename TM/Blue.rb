require_relative 'Color.rb'

class Blue < Color
  def rgb
    return "#0000FF"
  end
end

puts Blue.new(objeto: 'car').rgb;
