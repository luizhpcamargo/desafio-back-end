class Store < ApplicationRecord

  validates_presence_of :owner, :name
end
