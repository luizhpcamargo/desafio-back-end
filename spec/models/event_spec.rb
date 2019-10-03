require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.new }

  it { expect(event).to be_invalid }

  it do
    event.type = 1
    expect(event.type).to eq 'debt'
    expect(event).to be_invalid
    event.document = '1'
    expect(event).to be_invalid
    event.value = 100
    expect(event).to be_invalid
    event.store = Store.new(name: 'teste', owner: 'teste')
    expect(event).to be_valid
  end
end
