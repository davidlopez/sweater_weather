class Today
  def self.info(forcast_data)
    {
      today_summary: forcast_data[:hourly][:summary],
      tonight_summary: self.tonight(forcast_data[:hourly][:data]),
      high: forcast_data[:daily][:data][0][:temperatureHigh],
      low: forcast_data[:daily][:data][0][:temperatureLow],
      date: Time.now.to_date
    }
  end

  private

    def self.tonight(hour_data)
      hour_data.find do |hour|
        Time.at(hour[:time]).in_time_zone('America/New_York').hour == 20
      end[:summary]
    end
end
