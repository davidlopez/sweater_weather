class Antipode
  attr_reader :id, :search_location

  def initialize(location)
    @id = nil
    @search_location = location
  end

  def location_name
  end

  def currently
    {
      summary: antipode_weather_data[:currently][:summary],
      temperature: antipode_weather_data[:currently][:temperature]
    }
  end

  private

    def antipode_weather_data
      @antipode_weather_data ||= DarkskyService.new(lat_long).get_forcast
    end

    def antipode_location_data
      @antipode_location_data ||= GoogleService.new(@search_location).get_location
    end
end
