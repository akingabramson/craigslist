class Cat < ActiveRecord::Base
  attr_accessible :lightweight, :username
  extend FriendlyId
  friendly_id :username, use: :slugged
end
