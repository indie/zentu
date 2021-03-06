class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :idea
  # attr_accessible :title, :body
end
