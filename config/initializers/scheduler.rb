# frozen_string_literal: true

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new(lockfile: '.rufus-scheduler.lock')

unless scheduler.down?
  scheduler.cron('0 0 * * *') do
    Rails.logger.info "===== every day cron ===== #{Time.now} ====="
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
end
