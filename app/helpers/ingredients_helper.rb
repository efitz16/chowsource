module IngredientsHelper
  def options_for_measurements
    measurements = []
    Measurement.all.each do |measurement|
      measurements << measurement.name
    end
    measurements
  end

end
