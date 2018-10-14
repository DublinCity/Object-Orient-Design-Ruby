class MegaGreeter
    attr_accessor :names
    def initialize(names= "world")
        @names = names
    end
    
    def say_hi
        if @names.nil?
          puts "..."
        elsif @names.respond_to?("each")
          @names.each do |name|
              puts "hello #{name}"
          end
        else
          puts "hello #{@names}"
        end
    end
end

mg = MegaGreeter.new
mg.say_hi

mg.names = "zeke"
mg.say_hi

mg.names = ["zeke", "kad", "rrr"]
mg.say_hi

