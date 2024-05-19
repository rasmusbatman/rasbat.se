class SiteGen::Page
    private

    INLINE_METADATA_STX = "<!--\r\n"
    INLINE_METADATA_ETX = "-->\r\n"

    def parse_metadata
        lines = Array.new

        File.foreach(@path.absolute).with_index do |line, line_num|
            if line_num == 0
                if line == INLINE_METADATA_STX
                    next
                else
                    break
                end
            end

            if line == INLINE_METADATA_ETX
                break
            end
            
            lines << line
        end

        res = lines.join('')

        return Tomlrb.parse(res, symbolize_keys: true)
        
    rescue Tomlrb::ParseError => err
        raise SiteGen::SyntaxError.new(
            rescued: err,
            culprit: @path.absolute,
            remark: 'Check your syntax!'
        )
    end

end