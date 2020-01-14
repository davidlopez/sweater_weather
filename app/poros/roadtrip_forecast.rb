class RoadtripForecast
  attr_reader :summary, :temp

  def initialize(darksky_prediction)
    @summary = prediction_summary(darksky_prediction)
    @temp = prediction_temp(darksky_prediction)
  end

  private

    def prediction_summary(darksky_prediction)
      darksky_prediction[:currently][:summary]
    end

    def prediction_temp(darksky_prediction)
      darksky_prediction[:currently][:temperature]
    end
end
