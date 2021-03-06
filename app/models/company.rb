class Company < ActiveRecord::Base
  attr_accessible :citizen_id, :city, :description, :image, :name, :state, :telephone, :website, :category

  belongs_to :citizen

  mount_uploader :image, SupplementalUploader

end
