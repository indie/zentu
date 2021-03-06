class Plan < ActiveRecord::Base
  attr_accessible :name, :price, :star
   has_many :subscriptions
end
