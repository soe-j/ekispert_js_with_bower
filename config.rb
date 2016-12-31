###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# bower (manage javascript library) install directory
import_path File.expand_path('tmp/bower_components', app.root)

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do

  # loading in templates
  def bower_javascripts_include_tag
    js_paths = []
    Dir.glob('./tmp/bower_components/*') do |components_dirpath|
      dirname = File.basename(components_dirpath)
      Dir.glob("./tmp/bower_components/#{dirname}/*.js") do |components_filepath|
        filename = File.basename(components_filepath)
        js_paths << "#{dirname}/#{filename}"
      end
    end
    js_paths.map do |path|
      content_tag :script, nil, {src: "/bower_components/#{path}"}
    end.join
  end

end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
