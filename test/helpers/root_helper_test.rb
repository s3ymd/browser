require 'test_helper'
require 'root_helper'

class RootHelperTest < ActionView::TestCase
    include RootHelper
    
    module M
        module TestModule; end
        class TestClass; end
        class TestException < Exception; end
        TEST_CONST = 'test'
    end

    test 'partition_consts' do

        classes, modules, exceptions, etc = partition_consts(M)

        assert_equal(1, classes.size)
        assert_equal(1, modules.size)
        assert_equal(1, exceptions.size)
        assert_equal(1, etc.size)
        
    end
end
