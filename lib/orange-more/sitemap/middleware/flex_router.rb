require 'orange-core/middleware/base'

module Orange::Middleware
  # The FlexRouter middleware takes a resource that can route paths and
  # then intercepts routes for that resource. By default,
  # it uses the Orange::SitemapResource. 
  # 
  # The resource is automatically loaded into the core as 
  # :sitemap. The resource must respond to "route?(path)" 
  # and "route(packet)".  
  # 
  # Pass a different routing resource using the :resource arg
  class FlexRouter < Base    
    # Sets the sitemap resource as the router if the resource can accept 
    # the path.
    def packet_call(packet)
      return (pass packet) if packet['route.router']  # Don't route if other middleware
                                                      # already has
      path = packet['route.path'] || packet.request.path_info
      packet['route.router'] = orange[:sitemap] if orange[:sitemap].route?(packet, path)
      pass packet
    end
    
  end
end