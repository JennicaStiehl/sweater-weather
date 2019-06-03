class Hour
  attr_reader :summary,
                    :temp,
                    :time

  def initialize(data)
    @summary = data[:summary]
    @temp = data[:temperature]
    @time = data[:time]
  end
end
