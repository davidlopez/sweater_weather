class Backround

  def initialize(location)
    @location = location
  end

  def url
    images = UnsplashService.new(@location).get_background[:results]
    images.empty? ? default_image : image[0][:urls][:full]
  end

  private

    def default_image

    end
end
