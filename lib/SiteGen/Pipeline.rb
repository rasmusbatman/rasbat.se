class SiteGen::Pipeline
    def initialize(*pipes)
        @pipes = Array.new

        pipes.each { |pipe| @pipes << method(pipe) }
    end

    def call(stuff)
        @pipes.each { |pipe| stuff = pipe.call(stuff) }

        return stuff
    end

    def each(stuff)
        @pipes.each do |pipe|
            yield pipe.call(stuff)
        end
    end
    
end