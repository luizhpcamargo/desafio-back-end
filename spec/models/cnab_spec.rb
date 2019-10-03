require 'rails_helper'

describe Importer::Cnab do
  let(:cnab_input) { File.expand_path('spec/fixtures/cnab.txt') }
  let(:importer) { described_class.new(cnab_input) }

  context 'import file' do
    it { expect{importer.import!}.to_not raise_error }
    it { expect(importer.import!.size).to eq 21 }
  end

  context 'after import' do
    it { expect{importer.import!}.to change{Event.count}.by(21) }
    it { expect{importer.import!}.to change{Store.count}.by(5)}
  end
end
