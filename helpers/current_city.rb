module Helpers
	require 'geokit'

	def to_coordinates
		@current_city = Geokit::Geocoders::GeonamesGeocoder.do_geocode "#{self}"
	end
end