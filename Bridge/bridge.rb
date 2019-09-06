#######################################
# Bridge Abstraction and derivatives
#######################################

# The Shape class represents the
# 'abstraction' in this example of the
# Bridge pattern.
class Shape
  # The implementor for the shape
  # is passed in on initialization.
  def initialize(implementor)
    @implementor = implementor
  end
end

# https://medium.com/@dljerome/design-patterns-in-ruby-bridge-7aebb1b7bbc6 
# The RectangleShape class represents a
# 'refined' abstraction. It shares
# methods with the CircleShape, but it has
# methods unique to a rectangle.
class RectangleShape < Shape
  # 'draw' calls the _implementors_
  # 'draw_rectangle' method.
  def draw
    @implementor.draw_rectangle
  end
end

# The CircleShape class represents a
# 'refined' abstraction. It shares
# methods with the RectangleShape, but
# it has methods unique to a circle.
class CircleShape < Shape
  # 'draw' calls the _implementors_
  # 'draw_circle' method.
  def draw
    @implementors.draw_circle
  end
end

###############################################
# Bridge Implementor and concrete implementors
###############################################

# The ShapeImplementor class represents
# the 'Implementor' in the Bridge
# pattern.
class ShapeImplementor
  # Abstract methods are defined, which the
  # 'concrete implementors' (subclasses)
  # of this class (ShapeImplementor)
  # must implement.
  
  def draw_circle
    raise '#draw_circle must be defined.'
  end
  
  def draw_rectangle
    raise '#draw_rectangle must de defined.'
  end
end

# Represents a 'concrete implementator'
# in the Bridge pattern.
#
# Defines code that maps explicitly to the
# drawing methods of a Windows computer.
class WindowsShapeImplementor < ShapeImplementor
  def draw_circle
    # Imagine code here that draws a circle.
  end
  
  def draw_rectangle
    # Imagine code here that draws a rectangle.
  end
end

# Represents a 'concrete implementor'
# in the Bridge pattern.
#
# Defines code that maps explicitly to the
# drawing methods of a Mac computer.
class MacShapeImplementor < ShapeImplementor
  def draw_circle
    # Imagine code here that draws a circle.
  end
  
  def draw_rectangle
    # Imagine code here that draws a rectangle.
  end
end

#######################################
# The Bridge pattern applied
#######################################

# Here, we are creating a rectangle on
# a Mac computer by pairing a refined
# shape abstraction (the RectangleShape)
# with a concrete shape implementor
# (the MacShapeImplementor).
rectangle = class RectangleShape.new(MacShapeImplementor.new)

# Drawing the rectangle with a drawing
# engine specific to a Mac computer.
rectangle.draw