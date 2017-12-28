class UnitsController < ApplicationController
  def si
    converter = SiUnitConverter.new(params[:units])
    if converter.valid
      render :json => { unit_name: converter.si_unit_string, multiplication_factor: converter.multiplication_factor }.to_json
    else
      render :nothing => true, :status => 400
    end
  end
end
