class Antipode
  attr_reader :id, :search_location

  def initialize(location)
    @id = nil
    @search_location = location
  end

  def location_name
    antipode_location_data[:formatted_address]
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

    def location_data
      @location_data ||= GoogleService.new(@search_location).get_location[:results][0]
    end

    def antipode_location_data
      @antipode_location_data ||= GoogleService.new(lat_long).get_latlng[:results][0]
    end

    def antipode_lat_long
      lat = location_data[:geometry][:location][:lat]
      long = location_data[:geometry][:location][:lng]
      @antipode_lat_long ||= AmypodeService.new(lat, long).get_antipode
    end

    def lat_long
      "#{location[:lat]},#{location[:long]}"
    end

    def location
      @location ||= antipode_lat_long[:data][:attributes]
    end
end
