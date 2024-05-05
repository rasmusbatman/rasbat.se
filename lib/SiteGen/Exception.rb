class SiteGen
    class Error < RuntimeError
        def initialize(message=nil, rescued=nil, culprit=nil, remark=nil)
            puts message if message
            if rescued
                puts "Caught: #{rescued.class}"
                puts "Cause: #{rescued.cause.to_s.strip}" if rescued.cause
            end
            puts "Culprit: #{culprit}" if culprit
            if remark
                puts
                puts remark
            end
            puts
        end
    end

    class SyntaxError < SiteGen::Error
    end

end