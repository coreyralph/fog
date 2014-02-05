class Ganeti < Fog::Bin
  class << self

    def class_for(key)
      case key
      when :compute
        Fog::Compute::Ganeti
      else
        raise ArgumentError, "Unsupported #{self} service: #{key}"
      end
    end

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
        when :compute
          Fog::Logger.warning("Ganeti[:compute] is not recommended, use Compute[:ganeti] for portability")
          Fog::Compute.new(:provider => 'Ganeti')
        else
          raise ArgumentError, "Unrecognized service: #{key.inspect}"
        end
      end
      @@connections[service]
    end

    def services
      Fog::Ganeti.services
    end

  end
end
