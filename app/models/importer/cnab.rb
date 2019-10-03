module Importer
  class Cnab
    attr_accessor :source

    def initialize(path)
      self.source = File.read(path)
    end

    def import!
      source.each_line.map{ |l| parse_line(l) }
    end

    private

    def parse_line(line)
      event = Event.new
      event.type = line[0].to_i
      event.event_time = "#{line[1..8]}#{line[42..47]}"
      event.value = line[9..18].to_f / 100
      event.document = line[19..29]
      event.card = line[30..41]
      event.store = find_or_create_store(line[48..61], line[62..80])
      event.save
    end

    def find_or_create_store(owner, name)
      Store.find_or_create_by(owner: owner, name: name)
    end
  end
end
