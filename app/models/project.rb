class Project < ActiveRecord::Base
  belongs_to :category, counter_cache: true

  def add_project_information
    
    begin
      object = LinkThumbnailer.generate(url)
    rescue
      return false
    end
    
    if !object.nil?
      self.title = object.title
      self.description = object.description
      self.cover = object.images.first.src.to_s if object.images.length != 0 
      return true
    end
    
  end  
end
