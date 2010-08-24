require 'orange-more/news/base'

module Orange::Plugins
  class News < Base
    views_dir       File.join(File.dirname(__FILE__), 'views')
    
    resource    Orange::NewsResource.new
  end
end

Orange.plugin(Orange::Plugins::News.new)

