class ConstantInfo
    attr_accessor :module, :name, :value_class, :value
    include Comparable

    def initialize(mod, name)
        @module = mod
        @name = name
        @value = mod.const_get(name)
        if @value.is_a?(Class)
            if @value == Exception || @value < Exception
                @value_class = 'Exception'
            else
                @value_class = @value&.class.to_s
            end
        else
            @value_class = @value&.class.to_s
        end
    end

    def <=>(other)
        c = @value_class <=> other.value_class
        if c == 0
            @name <=> other.name
        else
            c
        end
    end

    def self.from_module(mod)
        mod.constants.map do |sym|
            new(mod, sym)
        end.sort!
    end
        
end
