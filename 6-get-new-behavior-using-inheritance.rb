class Bicycle
    attr_reader :size, :tape_color, :style,
    :front_shock, :rear_shork

    def initialize(args)
      @size = args[:size]
      @tape_color = args[:tape_color]
      @style = args[:style]
      @front_shock = args[:front_shock]
      @rear_shork = args[:rear_shork]
    end

    def spares
      if style == :road
        {
          chain: '10-speed',
          tire_size: '23',
          tape_color: tape_color
        }
      else
        {
          chain: '10-speed',
          tire_size: '2.1',
          rear_shork: rear_shork,
        }
      end
    end
end

bike = Bicycle.new(
  size: 'S',
  style: :mountain,
  front_shock: 'Manitou',
  rear_shork: 'Fox')

puts(bike.spares)