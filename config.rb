require "helpers"
require "bootstrap-sass"

activate :blog do |blog|
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.permalink = "{title}.html"
  blog.taglink = "tag/{tag}.html"
  blog.layout = "post"
  blog.tag_template = "tag.html"
  blog.paginate = true
end

config[:meta] = {
  blog: {
    url: 'http://www.joeycody.com/',
    name: 'Joey Cody',
    description: 'Software Engineer in San Francisco, CA.',
    date_format: '%d %B %Y',
    navigation: true,
    logo: nil,
  },
  author: {
    name: 'Joey Cody',
    bio: 'Software Engineer in San Francisco, CA.',
    location: 'San Francisco, CA',
    website: 'http://www.joeycody.com/',
    gravatar_email: 'joeydcody@gmail.com',
    twitter: '@joeycdy',
  },
  back_to_blog: true
}

proxy "/author/#{config.meta[:author][:name].parameterize}.html",
  '/author.html', ignore: true

# Pretty URLs as Directory Indexes, instead of file extensions
activate :directory_indexes

page "/blog-index.html", layout: "ghost_layout"

# Set build and assets directories
set :build_dir, "tmp"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"

# Middleman-Syntax - https://github.com/middleman/middleman-syntax
activate :syntax, line_numbers: false
set :haml, { ugly: true }

# Disable Haml warnings
Haml::TempleEngine.disable_option_validator!

set :markdown_engine, :redcarpet
set :markdown,
  fenced_code_blocks: true,
  smartypants: true, footnotes: true,
  link_attributes: { rel: 'nofollow' },
  tables: true

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
