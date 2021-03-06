class Parcel < ActiveRecord::Base
  attr_accessible :acreage, :apn, :attachments, :auction_end, :bid_open, :citizen_id, :deed, :legal_desc, :maplink, :name, :parcel_details, :poa, :state, :zoning

  belongs_to :citizen

#  mount_uploader :image, SupplementalUploader

end
