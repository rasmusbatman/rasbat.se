# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    def insert basename
        path = File.join @config.path(App::INSERTS), basename + '.erb'

        template = ERB.new File.read(path)

        eval template.src
    end
end