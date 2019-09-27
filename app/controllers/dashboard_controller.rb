# frozen_string_literal: true

# dashboard controller
class DashboardController < ApplicationController
  def index
    @weathers = Weather.all.order(created_at: :desc)
    @temperatures = @weathers.last(7).map(&:temperature).unshift('Temperature')
    @dates = @weathers.last(7).map(&:date)
  end
end
