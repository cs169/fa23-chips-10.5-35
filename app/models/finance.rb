# frozen_string_literal: true

require 'faraday'

class Finance < ApplicationRecord
  belongs_to :representative

  def self.campaign_finances_to_representative_params(params)
    base_url = 'https://api.propublica.org/campaign-finance/v1/'
    endpoint = "#{params[:cycle]}/candidates/leaders/#{params[:category]}.json"
    url = "#{base_url}#{endpoint}"

    response = Faraday.get(url) do |req|
      req.headers['X-API-Key'] = Rails.application.credentials[:PROPUBLICA_API_KEY]
    end

    response.body
  end
end
