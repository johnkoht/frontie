require "frontie/version"

module Frontie
  if defined?(Rails)
    require "frontie/engine"
  end
end
