module Orange
  class Slices < Orange::Resource
    call_me :slices
    def stack_init
      orange[:radius].define_tag "slice" do |tag|
        content = ''
        resource = (tag.attr['resource'] || :slices).to_sym
        id = tag.attr['id'] || nil
        mode = (tag.attr['mode'] || tag.attr['action'] || tag.attr['chunk'] || (id ? :show : :index )).to_sym
        if orange.loaded?(resource)
          opts = {:attrs => tag.attr, :mode => mode}
          opts.merge!(:id => id) if id
          ret = orange[resource].view(tag.locals.packet, opts)            
          if ret.blank? 
            content << "resource #{resource} doesn't respond to #{mode}" 
          else
            content << ret
          end
        else
          content << "resource #{resource} not loaded"
        end  
        content
      end
    end
    
    def view(packet, *args)
      opts = args.extract_options!
      mode = opts[:mode] || packet['route.resource_action']
      do_view(packet, mode, args.extract_options!)
    end
    
    def method_missing(mode, *args)
      packet = args.first if args.first.kind_of? Orange::Packet
      opts = args.extract_options!
      opts[:resource_name] = 'slices'
      do_view(packet, mode, opts)
    end
  end
end