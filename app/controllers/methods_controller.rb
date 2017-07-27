class MethodsController < ApplicationController

  def search
    case request.method.upcase
    when 'GET'
      @pattern = ''
      @result = []
    when 'POST'
      @pattern = params[:search] && params[:search][:pattern]
      if @pattern && @pattern.size > 0
        @result = find Regexp.new(Regexp.escape(@pattern))
      else
        @result = []
      end
    end
  end

  private
    def find(pattern)
      ObjectSpace.each_object(Module).flat_map { |mod|
        finder = -> method, flag, message {
          mod.send(method, flag).grep(pattern).map { |found|
            [mod, found, message]
          }
        }
        finder[:singleton_methods, true, 'singleton method'] +
        finder[:public_instance_methods, false, 'public instance method'] +
        finder[:protected_instance_methods, false, 'protected instance method'] +
        finder[:private_instance_methods, false, 'private instance method']
      }
    end
  
end
