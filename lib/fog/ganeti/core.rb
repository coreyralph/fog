require 'fog/core'

module Fog
  module Ganeti

    extend Fog::Provider

    service(:compute, 'Compute')

  end
end

