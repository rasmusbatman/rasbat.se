class SiteGen::Data
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