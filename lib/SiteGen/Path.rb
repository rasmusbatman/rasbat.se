class SiteGen::Path
    attr_reader :fullpath, :shortpath

    def initialize(path: nil, origin: nil)
        unless path
            raise SiteGen::ArgumentError(
                message: 'No path was provided',
                culprit: path
            )
        end

        if origin
            format_origin path, origin
        else
            format_absolute path
        end
    end

    private
end