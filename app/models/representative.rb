# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      rep_params = { name: official.name, ocdid: '', party: '', photo_url: '',
          zip: '', address: '', city: '', state: '' }
    

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          rep_params[:title] = office.name
          rep_params[:ocdid] = office.division_id
        end
        unless official.address.nil?
          rep_params[:address] = official.address[0].line1
          rep_params[:city] = official.address[0].city
          rep_params[:state] = official.address[0].state
          rep_params[:zip] = official.address[0].zip
        end

        rep_params[:photo_url] = official.photo_url if official.instance_variable_defined?(:@photo_url)
        rep_params[:party] = official.party if official.instance_variable_defined?(:@party)
      end

      representative = Representative.find_or_initialize_by(name: official.name, ocdid: rep_params[:ocdid])
      if representative.new_record?

        representative = Representative.create!(rep_params)
        representative.save!
      end
      reps.push(representative)
    end
    reps
  end
end
