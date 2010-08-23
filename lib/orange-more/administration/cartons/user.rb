require 'orange-core/carton'

class OrangeUser < Orange::Carton
  id
  admin do
    title :name
    text :open_id
  end
  
  has n, :orange_sites, :through => Resource
  
  def allowed?(packet)
    subsite_access = packet['subsite'].blank? ? false : self.orange_sites.first(:id => packet['subsite'].id)
    site_access = self.orange_sites.first(:id => packet['site'].id)
    if(!site_access.blank?)
      true
    elsif !packet['subsite'].blank? && subsite_access
      true
    else  
      # nil out invalid user
      packet.session['user.id'] = nil
      packet['user.id'] = nil
      false
    end
  end
end

class OrangeSite 
  has n, :orange_users, :through => Resource
end