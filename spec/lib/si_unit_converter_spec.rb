require_relative "../../lib/si_unit_converter.rb"

describe SiUnitConverter do
  describe 'valid_unit_string?' do
    ['degree', 'degree/minute', '(degree/(minute*hectare))', 'ha*°'].each do |test_string|
      it "should return true for valid string: '#{test_string}'" do
        expect(SiUnitConverter.valid_unit_string?(test_string)).to be true
      end
    end

    ['bla', 'degree+minute', 'hour minute', ''].each do |test_string|
      it "should return false for invalid string: '#{test_string}'" do
        expect(SiUnitConverter.valid_unit_string?(test_string)).to be false
      end
    end
  end

  describe 'converted unit string' do
    test_unit_strings = {
      'degree/minute' => 'rad/s',
      '(tonne/day)' => '(kg/s)',
      '(L*")/min' => '(m^3*rad)/s'
    }

    test_unit_strings.keys.each do |test_string|
      it "should correctly convert the given unit string: '#{test_string}'" do
        expect(SiUnitConverter.new(test_string).si_unit_string).to eq(test_unit_strings[test_string])
      end
    end
  end
end 