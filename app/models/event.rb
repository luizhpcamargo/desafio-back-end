class Event < ApplicationRecord
  enum event_type: { debt: 1, boleto: 2, financing: 3, credit: 4, loan: 5, sales: 6, ted: 7, doc: 8, rent: 9 }

  belongs_to :store
  validates_presence_of :event_type, :document, :value, :store_id

  def incoming?
    [1,4,5,6,7,8].include? Event.event_types[event_type]
  end

  def formatted_value
    incoming? ? value : value*(-1)
  end
end
