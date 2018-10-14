class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end  

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "this #{self.class} cannot respond to:"
  end

  def post_initialize(args)
    nil
  end

  def spares
    {
      chain: chain,
      tire_size: tire_size
    }.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def default_tire_size
    '23'
  end
  
  def local_spares
    {
      tape_color: tape_color
    }
  end

end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shork

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shork = args[:rear_shork]
  end

  def default_tire_size
    '2.1'
  end

  def local_spares
    {
      rear_shork: rear_shork, 
      front_shock: front_shock
    }
  end

end

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def default_tire_size
    '28'
  end

  def local_spares
    {
      flag: flag
    }
  end
end

roadBike = RoadBike.new(
  size: 'M',
  tape_color: 'red')

mountainBike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shork: 'Fox')
bent = RecumbentBike.new(flag: 'tall Orange')

puts(roadBike.spares)
puts(mountainBike.spares)
puts(bent.spares)
