desc "Daily weather"
task :daily_weather => :environment do
  open_weather_api = Rails.configuration.open_weather_api
  if open_weather_api.present?
    begin
      result = open_weather_api.current city: 'New York'
      Rails.logger.info "===== result ===== #{result} ====="
      if result.present? && result.is_a?(Hash)
        weather = Weather.new
        weather.response_data = result
        weather.save
      end
    rescue => e
      Rails.logger.info "===== error found in open weather api ===== #{e} ====="
    end
  end
end