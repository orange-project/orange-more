module Orange
  class Slices < Orange::Resource
    call_me :slices
    def stack_init
      orange[:radius].define_tag "slice" do |tag|
        content = ''
        resource = (tag.attr['resource'] || :slices).to_sym
        id = tag.attr['id'] || nil
        mode = (tag.attr['mode'] || tag.attr['chunk'] || (id ? :show : :index )).to_sym
        if orange.loaded?(resource)
          if orange[resource].respond_to?(mode) || resource == :slices
            content << (id ? orange[resource].__send__(mode, tag.locals.packet, :id => id) : orange[resource].__send__(mode, tag.locals.packet, {:attrs => tag.attr}))
          elsif orange[resource].class.viewable_actions.include?(mode)
            opts = {:attrs => tag.attr}
            opts.merge!(:id => id) if id
            content << orange[resource].viewable(tag.locals.packet, mode, opts)
          else
            content << "resource #{resource} doesn't respond to #{mode}"
          end
        else
          content << "resource #{resource} not loaded"
        end  
        content
      end
    end
    
    def view(packet, *args)
      mode = packet['route.resource_action']
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