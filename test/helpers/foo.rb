class X
    module M
        module TestModule; end
        class TestClass; end
        class TestException < Exception; end
        TEST_CONST = 'test'
    end

    def foo
        p M::TestModule
        p M::TestClass
        p M::TestException
        p M::TEST_CONST
    end
    
end
X.new.foo