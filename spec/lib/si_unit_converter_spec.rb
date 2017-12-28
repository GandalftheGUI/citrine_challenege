require_relative "../../lib/si_unit_converter.rb"

describe SiUnitConverter do
  describe 'valid_unit_string?' do
    ['degree', 'degree/minute', '(degree/(minute*hectare))', 'ha*°'].each do |test_string|
      it "should return true for valid string: '#{test_string}'" do
        expect(SiUnitConverter.valid_unit_string?(test_string)).to be true
      end
    end

    ['bla', 'degree+minute', 'hour minute'].each do |test_string|
      it "should return false for invalid string: '#{test_string}'" do
        expect(SiUnitConverter.valid_unit_string?(test_string)).to be false
      end
    end
  end
end 