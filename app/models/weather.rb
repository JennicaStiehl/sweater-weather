class Weather
  attr_reader :id,
                    :data


  def initialize(data)
    @data = data
    @id = 1
  end

  def hourly
    @data[:hourly][:data].first(8).map do |hour|
      Hour.new(hour)
    end
  end

  def daily
    @data[:daily][:data].first(7).map do |day|
      Day.new(day)
    end
  end

  def current
    Current.new(@data[:currently])
  end

  # def tonight
  #   @data[:hourly].max do |time|
  #     time[:summary]
  #   end
  # end
end
