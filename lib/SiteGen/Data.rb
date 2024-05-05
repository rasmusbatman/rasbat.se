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
            raise StandardError.new ""
        end
    end

    private

    def iterate(dir=PATH, hash=nil)
        unless hash
            hash = @hash
        end

        Dir.foreach(dir) do |filename|
            next if filename == '.' or filename == '..'

            filepath = File.join dir, filename

            if filepath.end_with?('.json')
                key = filename[0..-6].to_sym
                value = JSON.load_file filepath
                hash[key] = value
                
            elsif File.directory? filepath
                key = filename.to_sym
                hash[key] = iterate filepath, Hash.new
            end
        end

        @hash = hash
    end
    
end