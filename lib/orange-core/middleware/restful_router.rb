require 'orange-core/middleware/base'

module Orange::Middleware
  class RestfulRouter < Base
    def init(*args)
      opts = args.extract_options!.with_defaults(:contexts => [:admin, :orange], :not_found => false)
      @contexts = opts[:contexts]
      @not_found = opts[:not_found]
    end
    
    # sets resource, resource_id, resource_action and resource_path
    # /resource/id/action/[resource/path/if/any]
    # /resource/action/[resource/path/if/any]
    # 
    # In future - support for nested resources
    def packet_call(packet)
      return (pass packet) if packet['route.router']  # Don't route if other middleware
                                                      # already has
      if(@contexts.include?(packet['route.context']))
        path = packet['route.path'] || packet.request.path_info
        parts = path.split('/')
        pad = parts.shift
        if !parts.empty?
          resource = parts.shift
          if orange.loaded?(resource.to_sym)
            packet['route.resource'] = resource.to_sym
            if !parts.empty?
              second = parts.shift
              if second =~ /^\d+$/
                packet['route.resource_id'] = second
                if !parts.empty?
                  packet['route.resource_action'] = parts.shift.to_sym
                end
              else
                packet['route.resource_action'] = second.to_sym
              end 
            end # end check for second part
          else
            parts.unshift(resource)
          end # end check for loaded resource
        end # end check for nonempty route
        
        if(packet['route.resource', false]) 
          packet['route.resource_path'] = parts.unshift(pad).join('/')
          packet['route.router'] = self
        elsif(@not_found)
          packet['route.resource'] = @not_found
          packet['route.resource_path'] = parts.unshift(pad).join('/')
          packet['route.router'] = self
        end
      end # End context match if
      
      pass packet
    end
    
    def route(packet)
      resource = packet['route.resource']
      raise 'resource not found' unless orange.loaded? resource
      mode = packet['route.resource_action'] || 
        (packet['route.resource_id'] ? :show : :list)
      packet[:content] = orange[resource].view packet
    end
  end
end