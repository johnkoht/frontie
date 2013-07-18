module UtilityHelper

  # takes a string and will return the same string but with email addresses encoded and hyperlinked
  def emailitize text
    text.gsub(/([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i) {|m|
      mail_to(m, m.gsub("@", "[at]"), :encode=>:hex)
    }
  end

end