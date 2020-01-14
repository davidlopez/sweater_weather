class UnsplashService
  def initialize(location)
    @location = location
  end

  def get_background
    backround_json
  end

  private

    def connection
      Faraday.new('https://api.unsplash.com/search/photos') do |faraday|
        faraday.params[:query] = @location
        faraday.params[:client_id] = ENV['UNSPLASH_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end

    def backround_json
      response = connection.get
      JSON.parse(response.body, symbolize_names: true)
    end
end
