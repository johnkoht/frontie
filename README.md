# Frontie

Frontie is a suite of helpers for building Rails front-ends. 

## Installation

Add this line to your application's Gemfile:

    gem 'frontie'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frontie

## Usage

### Active State Helpers

A few simple helpers to set the active state for navigational components. The helper will match against controller and actions names and return `class="active"` or nothing.

    # active_for_controller will return 'active' if paramater matches controller_name
    %li= link_to "Products", products_path, class: "products #{active_for_controller("products"}"
    
    # active_for will return 'active' if paramter matches action_name
    %li= link_to "Edit", edit_product_path(@product), class: "product #{active_for("edit")}"
    
    # active_for_controller_and_action returns 'active' if matches controller and action
    %li= link_to "Drafts", draft_products_path, class: active_for_controller_and_action("admin/products", "drafts")
    
    # active_for_controllers will return 'active' if matches any controllers passed in aray
    %li= link_to "Products", products_path, class: active_for_controllers(["products", "categories", "tags"])
    

### Body Class Helper

Simple get and set methods for <body> class. By default, the helper will define the body classes based on the controller and action names. You can simple add to your body tag:

    # Default controller and action names
    %body{class: body_class} #=> <body class="application application-index">

You can add additional body classes by using the `set_body_class` method in your views:

    # views/application/index.html.haml
    - set_body_class "homepage dark-background"
    #=> <body class="application application-index homepage dark-background">


### Date Helpers

There are a few date format helpers, these were based on some recurring needs we had but feel free to customize. See the date_time_helper.rb for more details.


### Link Helpers

A nice link helper for creating icon buttons. It plays nice with bootstrap.

    # Create a simple icon with link
    = icon_link_to "New Product", new_products_path, "icon-product" #=> <a href="/products/new"><i class="icon-product">New Product</a>

    # Pass any parameters as usual
    = icon_link_to "Delete Product", product_path(@product), "icon-trash", confirm: "Are you sure?", method: :delete
    #=> <a href="products/5" confirm="Are you sure?" method="delete">Delete Product</a>
    

### Map Helper

Easily create Google map links and images

    # Simple map link
    = map_link "800 W. Huron St. Chicago, IL 60642", "Visit our office"
    
    # Map Image
    # pass an object with longitude and latitude attributes
    = map_image @office_location, width: "250", height: "275"
    


... more to come.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
