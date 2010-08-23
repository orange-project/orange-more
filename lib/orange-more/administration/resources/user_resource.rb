module Orange
  class UserResource < Orange::ModelResource
    use OrangeUser
    call_me :users
    def afterLoad
      orange[:admin].add_link("Settings", :resource => @my_orange_name, :text => 'Users')
    end
    
    def access_allowed?(packet, user)
      u = model_class.first(:open_id => user)
      unless u
        users = model_class.all
        # Deep open id search (take out trailing slash, etc.)
        id = user.gsub(/^https?:\/\//, '').gsub(/\/$/, '')
        matches = users.select{|u|
          (id == u.open_id.gsub(/^https?:\/\//, '').gsub(/\/$/, ''))
        }
        if(matches.length > 0 && matches.first.allowed?(packet))
          packet.session['user.id'] = matches.first.open_id
          packet['user.id'] = matches.first.open_id
          return true
        else
          return false
        end
      end
      u.allowed?(packet)
    end
    
    def user_for(packet)
      model_class.first(:open_id => packet['user.id'])
    end
    
    def onNew(packet, opts = {})
      params = opts
      sites = params.delete 'sites'
      m = model_class.new(params)
      m.save
      sites.each{|k,v| s = OrangeSite.first(:id => k); m.orange_sites << s if s} if sites
      m
    end
    
    def onSave(packet, obj, params ={})
      sites = params.delete 'sites'
      obj.update(params)
      obj.orange_sites = []
      sites.each{|k,v| s = OrangeSite.first(:id => k); obj.orange_sites << s if s} if sites
      obj.save
    end
    
    def find_extras(packet, mode)
      {:sites => OrangeSite.all}
    end
  end
end