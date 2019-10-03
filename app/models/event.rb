class Event < ApplicationRecord
  enum type: { debt: 1, boleto: 2, financing: 3, credit: 4, loan: 5, sales: 6, ted: 7, doc: 8, rent: 9 }

  belongs_to :store

  validates_presence_of :type, :document, :value
end
