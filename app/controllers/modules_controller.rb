class ModulesController < ApplicationController
  def show
    if params['module'] && params['module'] =~ /\A[\w:]+\z/
      @module = eval params['module']
    else
      @module = Object
    end
    @methods = MethodInfo.from_module(@module)
    @constants = ConstantInfo.from_module(@module)
  end  
end
