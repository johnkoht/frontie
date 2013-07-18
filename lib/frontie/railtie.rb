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
  initializer 'utility.helper' do |app|
    ActionView::Base.send :include, UtilityHelper
  end
end