class Current
  def self.info(current_info)
    {
      time: self.parse_time(current_info[:time]),
      summary: current_info[:summary],
      feels_like: current_info[:apparentTemperature],
      humidity: current_info[:humidity],
      visibility: current_info[:visibility],
      uv_index: current_info[:uvIndex],
      temp: current_info[:temperature]
    }
  end

  private

    def self.parse_time(time)
      Time.at(time.to_i).in_time_zone('UTC').strftime("%H:%M %p")
    end
end
