class Bicycle
    
end

class RoadBike < Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    {
      chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end
end

class MountainBike < Bicycle
    attr_reader :front_shock, :rear_shork

    def initialize(args)
      @front_shock = args[:front_shock]
      @rear_shork = args[:rear_shork]
      super(args)
    end

    def spares
      super.merge(rear_shork: rear_shork)
    end
end

mountainBike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shork: 'Fox')

puts(mountainBike.spares)
