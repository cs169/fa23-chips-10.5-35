# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  # rubocop:enable Metrics/BlockLength, Metrics/AbcSize, Metrics/MethodLength
  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      representative = build_representative(rep_info.offices, official, index)
      reps.push(representative)
    end

    reps
  end

  def self.build_representative(offices, official, index)
    ocdid_temp, title_temp, street_temp, city_temp, state_temp, zip_temp, party_temp, photo_url_temp = '','','','','','','',''

    offices.each do |office|
      if office.official_indices.include?(index)
        title_temp, ocdid_temp = office.name, office.division_id
        photo_url_temp = official.photo_url if official.instance_variable_defined?(:@photo_url)
        assign_address_info(official, street_temp, city_temp, state_temp, zip_temp)
      end
      party_temp = official.party if official.instance_variable_defined?(:@party)
    end

    representative = Representative.find_or_initialize_by(name: official.name, ocdid: ocdid_temp)
    create_rep(representative, official, title_temp, ocdid_temp, party_temp, photo_url_temp, zip_temp, street_temp, city_temp, state_temp)

    representative
  end

  def self.assign_address_info(official, street_temp, city_temp, state_temp, zip_temp)
    unless official.address.nil?
      street_temp = official.address[0].line1
      city_temp = official.address[0].city
      state_temp = official.address[0].state
      zip_temp = official.address[0].zip
    end
  end

  def self.create_rep(representative, official, title_temp, ocdid_temp, party_temp, photo_url_temp, zip_temp, street_temp, city_temp, state_temp)
    if representative.new_record?
      rep_params = {
        name: official.name, ocdid: ocdid_temp, party: party_temp,
        photo_url: photo_url_temp, zip: zip_temp, address: street_temp,
        city: city_temp, state: state_temp
      }

      representative = Representative.create!(rep_params)
      representative.title = title_temp
      representative.save!
    end
  end
end
