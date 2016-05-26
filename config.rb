activate :blog do |blog|
#   # This will add a prefix to all links, template references and source paths
#   blog.prefix = "blog"

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

  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.permalink = "{title}.html"
  blog.taglink = "tag/{tag}.html"
  blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

require "helpers"

config[:meta] = {
  blog: {
    url: 'http://www.joeycody.com/',
    name: 'Joey Cody',
    description: 'Ruby Engineer in San Francisco, CA.',
    date_format: '%d %B %Y',
    navigation: true,
    logo: nil # Optional
  },
  author: {
    name: 'Joey Cody',
    bio: 'Ruby Engineer in San Francisco, CA.', # Optional
    location: 'San Francisco, CA', # Optional
    website: 'http://www.joeycody.com/', # Optional
    gravatar_email: 'joeydcody@gmail.com', # Optional
    twitter: '@joeycdy' # Optional
  },
  back_to_blog: true
}

proxy "/author/#{config.meta[:author][:name].parameterize}.html",
  '/author.html', ignore: true


# Pretty URLs as Directory Indexes, instead of file extensions
activate :directory_indexes

page "/blog-index.html", :layout => "ghost_layout"

# Set build and assets directories
set :build_dir, "tmp"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"

# Middleman-Syntax - https://github.com/middleman/middleman-syntax
set :haml, { ugly: true }
set :markdown_engine, :redcarpet
set :markdown,
  fenced_code_blocks: true,
  smartypants: true, footnotes: true,
  link_attributes: { rel: 'nofollow' },
  tables: true
activate :syntax, line_numbers: false

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets

  activate :favicon_maker, icons: {
    "favicon_base.png" => [{ icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }]
  }
end

# Development-specific configuration
configure :development do
  activate :livereload
end
