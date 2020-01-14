class Hour
  def self.info(hour_info)
    {
      time: hour_info[:time],
      temp: hour_info[:temperature],
      icon: hour_info[:icon]
    }
  end
end
