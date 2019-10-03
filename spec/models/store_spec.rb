require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { Store.new }
  let(:store_with_name) { Store.new(name: 'teste') }
  let(:store_valid) { Store.new(name: 'teste', owner: 'teste')}

  it { expect(store).to be_invalid }
  it { expect(store_with_name).to be_invalid }
  it { expect(store_valid).to be_valid }

end
