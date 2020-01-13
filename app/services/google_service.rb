require 'faraday'
class GoogleService
  def initialize(location)
    @location = location
  end

  def get_location
    location_data
  end

  def get_latlng
    latlng_data
  end

  private

    def connection(route)
      Faraday.new("https://maps.googleapis.com/maps/api/#{route}/json") do |faraday|
        faraday.params['key'] = ENV['GOOGLE_MAPS_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end

    def location_data
      response = connection('geocode').get do |request|
        request.params['address'] = @location
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def latlng_data
      response = connection('geocode').get do |request|
        request.params['latlng'] = @location
      end
      JSON.parse(response.body, symbolize_names: true)
    end
end
