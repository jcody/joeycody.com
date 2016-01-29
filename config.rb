# activate :blog do |blog|
#   # This will add a prefix to all links, template references and source paths
#   blog.prefix = "blog"

#   # blog.permalink = "{year}/{month}/{day}/{title}.html"
#   # Matcher for blog source files
#   # blog.sources = "{year}-{month}-{day}-{title}.html"
#   # blog.taglink = "tags/{tag}.html"
#   # blog.layout = "layout"
#   # blog.summary_separator = /(READMORE)/
#   # blog.summary_length = 250
#   # blog.year_link = "{year}.html"
#   # blog.month_link = "{year}/{month}.html"
#   # blog.day_link = "{year}/{month}/{day}.html"
#   # blog.default_extension = ".markdown"

#   blog.tag_template = "tag.html"
#   blog.calendar_template = "calendar.html"

#   # Enable pagination
#   # blog.paginate = true
#   # blog.per_page = 10
#   # blog.page_link = "page/{num}"
# end

require "helpers"

# Pretty URLs as Directory Indexes, instead of file extensions
activate :directory_indexes

set :build_dir, "tmp"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"

# Build-specific configuration
configure :build do
  activate :favicon_maker
  activate :minify_css
  activate :minify_javascript

  activate :relative_assets
end

# Development-specific configuration
configure :development do
  activate :livereload
end
