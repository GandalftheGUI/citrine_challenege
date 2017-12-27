class SiUnitConverter

  attr_accessor :si_unit_string, :input_unit_string, :multiplication_factor 

  def initialize(input_unit_string)
    @input_unit_string = input_unit_string
    build_si_unit_string
    build_si_multiplication_factor
  end

  private

  def build_si_unit_string
  end

  def build_si_multiplication_factor
end