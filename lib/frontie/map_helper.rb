module MapHelper

  # Location and map helpers: Provide a google map link or image
  # ------------------------------------------------------------------------------------------------------
  
  # Return a Google Map link based on an address
  def map_link address, text="map"
    return if address.nil?
    link_to "https://maps.google.com/?q=#{address}", :class => "map-link", :title => "View in Google Maps", :target => "_blank" do
      "(#{text})"
    end
  end
  
  # Return a google map image for a given location
  def map_image location, width=500, height=275, zoom=15
    image_tag("http://maps.googleapis.com/maps/api/staticmap?center=#{location.latitude},#{location.longitude}&zoom=#{zoom}&size=#{width}x#{height}&markers=color:blue%7Clabel:1%7C#{location.latitude},#{location.longitude}&sensor=false", :class => "map_image")
  end

end