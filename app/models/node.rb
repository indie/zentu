class Node < ActiveRecord::Base
  attr_accessible :parent_id, :content, :name
  has_ancestry

  validates  :slug, uniqueness: true, presence: true,
              exclusion: {in: %w[signup login]}

  before_validation :generate_slug
  # trying to get the slugs to update automatically
  before_save :update_slug

  def to_param
    slug 
    # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug ||= name.parameterize
  end 

  # this might not work
  def update_slug
    self.slug || name_changed?
  end
  
  def self.to_csv( options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |node|
  			csv << node.attributes.values_at(*column_names)
  		end
  	end
  end

  def self.import(file)
	CSV.foreach(file.path, headers: true) do |row|
  		node = find_by_id(row["id"]) || new
	#	Node.create! row.to_hash
		node.attributes = row.to_hash.slice(*accessible_attributes)
		node.save!
  	end
  end

end

