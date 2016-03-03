class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :cover, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :url, presence: true

  belongs_to :category, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :user_project_relationships
  has_many :users, through: :user_project_relationships
  
  def self.search(input)
    where( "title LIKE ? or description LIKE ?", "%#{input}%", "%#{input}%")
  end  
  
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
  
  def like_by_user?(user)
    user.projects.include?(self)
  end
end
