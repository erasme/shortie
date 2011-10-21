# Define a subclass of Ramaze::Controller holding your defaults for all controllers. Note 
# that these changes can be overwritten in sub controllers by simply calling the method 
# but with a different value.

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml, :paginate
  engine :etanni
  
  # Configures the Paginate helper so that it shows a maximum of 10 posts per
  # page and uses the "page" query string key to determine the current page.
  # This will result in URLs such as /posts?page=2. Note that when calling the
  # paginate() method you can override these settings.
  trait :paginate => {
    :var   => 'page',
    :limit => 10
  }
end


# Here you can require all your other controllers. Note that if you have multiple
# controllers you might want to do something like the following:
#
#  Dir.glob('controller/*.rb').each do |controller|
#    require(controller)
#  end
#

require __DIR__('main')
require __DIR__('shorts')
