class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end  

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "this #{self.class} cannot respond to:"
  end

  def spares
    {
      chain: chain,
      tire_size: tire_size
    }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def default_tire_size
    '23'
  end
  
  def spares
    super.merge(tape_color: tape_color)
  end

end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shork

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shork = args[:rear_shork]
    super(args)
  end

  def default_tire_size
    '2.1'
  end

  def spares
    super.merge(rear_shork: rear_shork, front_shock: front_shock)
  end

end

class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(args)
    @flag = args[:flag]
  end

  def default_tire_size
    '28'
  end

  def spares
    super.merge(flag: flag)
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
