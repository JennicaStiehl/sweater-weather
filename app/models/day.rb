class Day
  def initialize(data)
    @icon = data[:icon]
    @high = data[:temperatureHigh]
    @low = data[:temperatureLow]
    @precip = data[:precipProbability]
  end
end
