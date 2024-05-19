require_relative './Page/parse_metadata'
require_relative './Page/find_metadata'

class SiteGen::Page
    def initialize(path)
        @metadata = find_metadata
    end
end