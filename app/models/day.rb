class Day
  attr_reader :icon,
                    :low,
                    :high,
                    :precip

  def initialize(data)
    @icon = data[:icon]
    @high = data[:temperatureHigh]
    @low = data[:temperatureLow]
    @precip = data[:precipProbability]
  end
end
