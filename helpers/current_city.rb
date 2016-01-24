module Helpers
  module CurrentCity
  	require "geokit"

  	def to_coordinates
  		Geokit::Geocoders::GeonamesGeocoder.do_geocode "#{self}"
  	end
  end
end
