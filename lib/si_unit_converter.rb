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
    '"' => 'rad',
    'ha' => 'm^2',
    'L' => 'm^3',
    't' => 'kg',
  }

  MULTIPLICATION_FACTOR_LOOKUP_TABLE = {
    'minute' => 60.0,
    'hour' => 3600.0,
    'day' => 86400.0,
    'degree' => (Math::PI/180),
    'second' => (Math::PI/648000),
    'hectare' => 10000.0,
    'litre' => 0.001,
    'tonne' => 1000.0,
    'min' => 60.0,
    'h' => 3600.0,
    'd' => 86400.0,
    '°' => (Math::PI/180),
    '\'' => (Math::PI/10800),
    '"' => (Math::PI/648000),
    'ha' => 10000.0,
    'L' => 0.001,
    't' => 1000.0,
  }

  attr_accessor :si_unit_string, :input_unit_string, :multiplication_factor

  def initialize(input_unit_string)
    @valid = false
    @input_unit_string = input_unit_string.dup
    return unless SiUnitConverter.valid_unit_string?(@input_unit_string)
    build_si_unit_string
    build_si_multiplication_factor
    @valid = true
  end

  #checks that input string contains only acceptable units and symbols
  def self.valid_unit_string?(unit_string)
    #NOTE: Does not check for balanced parenthesis or double operands (e.g. '**' or '/*')
    #checks if string contains only: { [a-zL] ( ) * / ' " ° }
    return false unless unit_string.count("^a-zL\(\)*\/\"\'°").zero?
    return false if unit_string.empty?
    #checks if unit string only contains the acceptable units
    units = unit_string.split(/[\(\)*\/]+/).reject(&:empty?)
    return !units.detect{|unit| UNIT_LOOKUP_TABLE[unit] == nil}
  end

  def valid?
    @valid
  end

  private

  def convert_string(lookup_table)
    tokens = @input_unit_string.split(/([\(\)*\/]+)/).reject(&:empty?)

    tokens.each_with_index do |token, index|
      tokens[index] = lookup_table[token] if lookup_table[token] != nil
    end

    return tokens.join
  end

  def build_si_unit_string
    @si_unit_string = convert_string(UNIT_LOOKUP_TABLE)
  end

  def build_si_multiplication_factor
    arithmetic_string = convert_string(MULTIPLICATION_FACTOR_LOOKUP_TABLE)
    throw "dangerous arithmetic string: '#{arithmetic_string}'" unless arithmetic_string.count("^\(\)/*[0-9].e-").zero?
    # I am aware that using eval isnt ideal, however given the time constraints I was given for this problem I wanted to get a working example out and felt this was appropriatae for a proof of concept.
    @multiplication_factor = eval(arithmetic_string).round(14)
  end
end
