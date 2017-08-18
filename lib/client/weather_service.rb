module Client
  class WeatherService
    def self.new
      @client ||= WeatherService::Client.new
    end

    def self.weather(area)
      new.weather(area)
    end
  end
end