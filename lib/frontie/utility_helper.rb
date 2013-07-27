module UtilityHelper

  # Create a conditional <html> tag
  def conditional_html lang = "en", &block
    haml_concat Haml::Util::html_safe <<-"HTML".gsub( /^\s+/, '' )
      <!--[if lt IE 7 ]><html lang="#{lang}" class="no-js ie6" > <![endif]-->
      <!--[if IE 7 ]><html lang="#{lang}" class="no-js ie7" > <![endif]-->
      <!--[if IE 8 ]><html lang="#{lang}" class="no-js ie8" > <![endif]-->
      <!--[if IE 9 ]><html lang="#{lang}" class="no-js ie9" > <![endif]-->
      <!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}" class="no-js" > <!--<![endif]-->      
    HTML
    haml_concat capture( &block ) << Haml::Util::html_safe( "\n</html>" ) if block_given?
  end


  # takes a string and will return the same string but with email addresses encoded and hyperlinked
  def emailitize text
    text.gsub(/([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i) {|m|
      mail_to(m, m.gsub("@", "[at]"), :encode=>:hex)
    }
  end

end