require 'frontie/active_state_helper'
require 'frontie/date_time_helper'
require 'frontie/links_helper'
require 'frontie/map_helper'
require 'frontie/utility_helper'

module Frontie
  class Railtie < Rails::Railtie
    initializer 'active_state.helper' do |app|
      ActionView::Base.send :include, ActiveStateHelper
    end
    initializer 'date_time.helper' do |app|
      ActionView::Base.send :include, DateTimeHelper
    end
    initializer 'links.helper' do |app|
      ActionView::Base.send :include, LinksHelper
    end
    initializer 'map.helper' do |app|
      ActionView::Base.send :include, MapHelper
    end
    initializer 'utility.helper' do |app|
      ActionView::Base.send :include, UtilityHelper
    end
  end
end