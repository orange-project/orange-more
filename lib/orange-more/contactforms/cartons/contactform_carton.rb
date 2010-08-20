class OrangeContactForm < Orange::Carton
  id
  admin do
    title :title
    text :to_address
    text :from_address
  end
  
  def self.named(tag)
    all(:title.like => "%#{tag}%")
  end

end