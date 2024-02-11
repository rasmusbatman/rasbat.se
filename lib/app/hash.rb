# Jon M © 2012-02-21, CC BY-SA 3.0
# https://stackoverflow.com/a/9381776

class ::Hash
    def deep_merge(second)
        merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
        self.merge(second, &merger)
    end
end