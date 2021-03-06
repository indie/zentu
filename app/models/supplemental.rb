class Supplemental < ActiveRecord::Base
	attr_accessible :image, :idea, :supplemental_id

	has_many :images
	belongs_to :idea

	mount_uploader :image, SupplementalUploader


  end 