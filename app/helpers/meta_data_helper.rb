module MetaDataHelper

  # Set the meta data
  def set_meta meta={}
    @meta = meta
  end

  # Display the meta data by merging @meta with defaults
  def display_meta defaults={}
    meta = defaults.merge(@meta || {}).reject{ |k,v| v.blank? }

    output = meta.map do |key, value|
      # If the value is a hash, let's iterate over those items
      # and add to our output
      if value.is_a?(Hash)
        value.map do |property, content|
          %Q[<meta name="#{key}:#{property}" content="#{normalize(content)}"/>]
        end.join("\n")
      else
          %Q[<meta name="#{key}" content="#{normalize(value)}"/>]
      end
    end.join("\n")

    output.html_safe
  end


  private
    def normalize s
      s.gsub(/<\/?[^>]*>/, '').gsub('"',"'") rescue s
    end

end