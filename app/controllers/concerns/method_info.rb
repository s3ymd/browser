class MethodInfo
    attr_accessor :module, :name, :visibility, :method_type
    include Comparable
    
    def initialize(mod, name, visibility, method_type)
        @module = mod
        @name = name
        @visibility = visibility
        @method_type = method_type
    end

    def <=>(other)
        v = @visibility <=> other.visibility
        if v == 0
            @name <=> other.name
        else
            v
        end
    end

    def self.from_module(mod)
        sins = mod.singleton_methods(false).map do |m|
            new(mod, m, :public, 'singleton method')
        end.sort!
        pubs = mod.public_instance_methods(false).map do |m|
            new(mod, m, :public, 'instance method')
        end.sort!
        pros = mod.protected_instance_methods(false).map do |m|
            new(mod, m, :protected, 'instance method')
        end.sort!
        pris = mod.private_instance_methods(false).map do |m|
            new(mod, m, :private, 'instance method')
        end.sort!
        sins + pubs + pros + pris
        
    end

end
