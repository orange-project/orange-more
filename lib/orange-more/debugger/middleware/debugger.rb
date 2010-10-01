require 'orange-core/middleware/base'

module Orange::Middleware
  class Debugger < Base
    def init(opts = {})
      orange.add_pulp Orange::Pulp::DebuggerHelpers if orange.options[:development_mode]
      orange.mixin Orange::Mixins::DebuggerMixin if orange.options[:development_mode]
    end
    
    # Passes packet then parses the return
    def packet_call(packet)
      if orange.options[:development_mode]
        packet.flash['redirect_to'] = packet.request.path
        packet.add_css('debug_bar.css', :module => '_debugger_')
      end
      pass packet
      if orange.options[:development_mode]
        bar = orange[:parser].haml('debug_bar.haml', packet)
        packet[:content] = packet[:content].gsub('</body>', bar + '</body>')
      end
      packet.finish
    end
    
  end
end

module Orange::Pulp::DebuggerHelpers
  def h_debug(obj)                  # :nodoc:
    case obj
    when String
      Rack::Utils.escape_html(obj)
    else
      begin 
        Rack::Utils.escape_html(obj.inspect)
      rescue Exception => e
        "Object #{obj.class.to_s} could not be inspected"
      end
    end
  end
end


module Orange::Mixins::DebuggerMixin
  def resources
    @resources
  end
end

class Rack::Builder 
  def inspect
    "#<Rack::Builder:#{self.object_id.to_s(16)} @ins=#{@ins.map{|x| x.instance_of?(Proc)? x.call(nil) : x }.inspect} >"
  end
end

