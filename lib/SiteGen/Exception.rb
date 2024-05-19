class SiteGen
    class Error < RuntimeError
        def initialize(message: nil, rescued: nil, culprit: nil, remark: nil)
            print "#{message}\n" if message
            if rescued
                print "Caught: #{rescued.class}\n"
                print "Cause: #{rescued.cause.to_s.strip}\n" if rescued.cause
            end
            print "Culprit: #{culprit}\n" if culprit
            print "\n#{remark}\n" if remark
            print "\n"
        end
    end

    class RuntimeError < SiteGen::Error
    end

    class ArgumentError < SiteGen::Error
    end

    class SyntaxError < SiteGen::Error
    end

    class NotImplementedError < SiteGen::Error
    end

end