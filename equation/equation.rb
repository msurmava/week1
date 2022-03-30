class Equation
  BPOWER = 2
  ACMULTIPLY = 4
  ZERO = 0
  AMULTIPLY = 2

  def initialize(acoeff,bcoeff,ccoeff)
    @acoeff = acoeff 
    @bcoeff = bcoeff 
    @ccoeff = ccoeff
  end

  def quadriatic
    root = []
    discriminant =  @bcoeff  **  BPOWER  - ACMULTIPLY  * @acoeff  * @ccoeff 
    if discriminant > ZERO
      root << ( -@bcoeff  + Math.sqrt(discriminant )) / AMULTIPLY * @acoeff
      root << ( -@bcoeff  - Math.sqrt(discriminant )) / AMULTIPLY * @acoeff
      root  = root.join(" and ")
    elsif discriminant == ZERO 
   root << (-@bcoeff  + Math.sqrt(discriminant))  / AMULTIPLY * @acoeff
    else
      return "This has no ROOTS!"
    end
    root
  end
end


puts Equation.new(1,-8,12).quadriatic
