class SiteGen::Parse
    def self.metadata(filepath)
        lines = Array.new

        File.foreach(filepath).with_index do |line, line_num|
            if line_num == 0 
                if line.start_with?('<!--')
                    next
                else
                    break
                end
            end

            if line.start_with?('-->')
                break
            end
            
            lines << line
        end

        res = lines.join('')

        return Tomlrb.parse(res, symbolize_keys: true)
        
    rescue Tomlrb::ParseError => err
        raise SiteGen::SyntaxError.new(rescued=err, culprit=filepath, remark="Check your syntax!")
    end

end