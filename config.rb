###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

activate :livereload
activate :directory_indexes

configure :build do
  activate :favicon_maker
end

# activate :blog do |blog|
#   blog.prefix = 'blog'
# end


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  require 'date'
  def to_coordinates(location)
    current_city = Geokit::Geocoders::GeonamesGeocoder.do_geocode location
    current_city.ll
  end

  def get_birthday
    interval = (Date.today - Date.new(1991, 3, 25)).to_i / 365.0
    interval.round(2)
  end
end

set :build_dir, "tmp"

set :css_dir, 'assets/css'

set :js_dir, 'assets/js'

set :images_dir, 'assets/img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
