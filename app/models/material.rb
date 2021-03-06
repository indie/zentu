class Material < ActiveRecord::Base
  attr_accessible :parent_id, :category, :description, :name

  has_ancestry

  def self.to_csv( options = {})
	CSV.generate(options) do |csv|
		csv << column_names
	   	all.each do |product|
	   		csv << material.attributes.values_at(*column_names)
   		end
   	end
  end

  def self.import(file)
	CSV.foreach(file.path, headers: true) do |row|
	   	material = find_by_id(row["id"]) || new
		# Node.create! row.to_hash
		material.attributes = row.to_hash.slice(*accessible_attributes)
		material.save!
   	end
  end

end
