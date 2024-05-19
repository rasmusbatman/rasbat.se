require_relative './Data/iterate'

class SiteGen::Data
    PATH = File.join(
        $ROOT,
        $CONFIG[:directories][:src],
        $CONFIG[:directories][:data]
    )

    def initialize
        @hash = Hash.new

        iterate
    end

    def get *keys
        res = @hash.dig(*keys)

        if res
            return res
        else
            raise SiteGen::RuntimeError.new(
                message: 'Tried to access non-existent key in data structure',
                culprit: keys.to_s,
                remark: 'This is probably due to a mistyped key and not programmatic'
            )
        end
    end
    
end