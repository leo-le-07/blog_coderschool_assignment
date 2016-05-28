class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def self.search(search)
    where("title ilike ?", "%#{search}%") 
  end

  def self.tagged_with(tagName)
    Tag.find_by_name!(tagName).articles
  rescue ActiveRecord::RecordNotFound
    []
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
