class Current
  def initialize(data)
    @data = data
    @current_summary = data[:summary]
    @current_icon = data[:icon]
    @current_temp = data[:temperature]
    @humidity = data[:humidity]
    @visibility = data[:visibility]
    @uv_index = data[:uvIndex]
    @feels_like = data[:apparent_temperature]
    @today = data[:summary]
  end

end
