require 'faraday'
class AmypodeService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_antipode
    get_json
  end

  private

    def connection
      Faraday.new("https://amypode.herokuapp.com/api/v1/antipodes") do |faraday|
        faraday.headers[:api_key] = ENV['AMYPODE_KEY']
        faraday.params['lat'] = @lat
        faraday.params['long'] = @long
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json
      response = connection.get
      JSON.parse(response.body, symbolize_names: true)
    end
end
