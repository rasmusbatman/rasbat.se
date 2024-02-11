# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    class Route
        attr_reader :name
        attr_reader :path
        attr_reader :document
    
        def initialize path
            @path = path
            @basename = self._basename 
            @document = self._document
        end

        private

        def _basename
            File.basename @path, '.erb'
        end

        def _document
            puts @basename

            "a"
        end
    end
end