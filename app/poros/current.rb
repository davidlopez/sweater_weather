class Current
  def self.info(current_info)
    {
      time: current_info[:time],
      summary: current_info[:summary],
      feels_like: current_info[:apparentTemperature],
      humidity: current_info[:humidity],
      visibility: current_info[:visibility],
      uv_index: current_info[:uvIndex],
      temp: current_info[:temperature],
      icon: current_info[:icon]
    }
  end
end
