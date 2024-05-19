require_relative './Route/gather'

class SiteGen::Route
    def initialize(filepath)
        raise SiteGen::NotImplementedError.new(culprit: __FILE__)
    end
end