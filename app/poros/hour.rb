class Hour
  def self.info(hour_info)
    {
      time: self.parse_time(hour_info[:time]),
      temp: hour_info[:temperature]
    }
  end

  private

    def self.parse_time(time)
      Time.at(time.to_i).in_time_zone('UTC').strftime("%I %p") 
    end
end
