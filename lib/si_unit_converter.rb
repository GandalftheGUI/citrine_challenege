class SiUnitConverter
  UNIT_LOOKUP_TABLE = {
    'minute' => 's',
    'hour' => 's',
    'day' => 's',
    'degree' => 'rad',
    'second' => 'rad',
    'hectare' => 'm^2',
    'litre' => 'm^3',
    'tonne' => 'kg',
    'min' => 's',
    'h' => 's',
    'd' => 's',
    '°' => 'rad',
    '\'' => 'rad',
    '\"' => 'rad',
    'ha' => 'm^2',
    'L' => 'm^3',
    't' => 'kg',
  }

  MULTIPLICATION_FACTOR_LOOKUP_TABLE = {
    'minute' => 60,
    'hour' => 3600,
    'day' => 86400,
    'degree' => (Math::PI/180),
    'second' => (Math::PI/648000),
    'hectare' => 10000,
    'litre' => 0.001,
    'tonne' => 1000,
    'min' => 60,
    'h' => 3600,
    'd' => 86400,
    '°' => (Math::PI/180),
    '\'' => (Math::PI/10800),
    '\"' => (Math::PI/648000),
    'ha' => 10000,
    'L' => 0.001,
    't' => 1000,
  }

  attr_accessor :si_unit_string, :input_unit_string, :multiplication_factor

  def initialize(input_unit_string)
    @input_unit_string = input_unit_string.downcase
    return unless SiUnitConverter.valid_unit_string?(@input_unit_string)
    build_si_unit_string
    build_si_multiplication_factor
  end

  #checks that input string contains only acceptable units and symbols
  def self.valid_unit_string?(unit_string)
    #NOTE: Does not check for balanced parenthesis
    #checks if string contains only: [a-z] ( ) * /
    return false unless unit_string.count("^a-z()*\/").zero?
    #checks if unit string only contains the acceptable
    units = unit_string.split(/[()*\/]+/).reject(&:blank?)
    return !units.detect{|unit| UNIT_LOOKUP_TABLE[unit] == nil}
  end

  private

  def convert_string(lookup_table)
    lookup_table.keys
  end

  def build_si_unit_string
  end

  #valid chars: ()*0-9
  def build_si_multiplication_factor
  end
end