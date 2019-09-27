# frozen_string_literal: true

# weather
class Weather < ApplicationRecord
  # serialization
  serialize :response_data, Hash

  # instance methods
  def country
    return response_data&.dig('sys', 'country') if response_data.present? && response_data.is_a?(Hash)
  end

  def state
    return response_data&.dig('name') if response_data.present? && response_data.is_a?(Hash)
  end

  def temperature
    return response_data&.dig('main', 'temp') if response_data.present? && response_data.is_a?(Hash)
  end

  def date
    return Time.at(response_data&.dig('dt')).utc.to_date.strftime('%v') if response_data.present? && response_data.is_a?(Hash) && response_data&.dig('dt').present?
  end
end
