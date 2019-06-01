class Hour
  def initialize(data)
    @summary = data[:summary]
    @temp = data[:temperature]
    @time = data[:time]
  end
end
