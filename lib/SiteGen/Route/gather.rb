class SiteGen::Route
    def self.gather
        raise SiteGen::NotImplementedError.new(culprit=__FILE__)
    end
end