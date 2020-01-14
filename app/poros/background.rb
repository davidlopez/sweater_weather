class Background
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def url
    images = UnsplashService.new(@location).get_background[:results]
    images.empty? ? default_image : images[0][:urls][:full]
  end

  private

    def default_image
      'https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/weather/cloud/cumulus-cloud.jpg'
    end
end
