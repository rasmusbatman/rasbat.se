# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    INSERTS = 'inserts'
    LAYOUTS = 'layouts'
    MODELS = 'models'
    ROUTES = 'routes'
    STATIC = 'static'
    OUTPUT = 'output'

    class Config
        attr_reader :data

        def initialize
            cfg = File.join App::ROOT, App::CFG_PATH

            if !File.exist? cfg
                puts "Tried to read #{cfg} but it does not exist!\nSee #{App::REPOSITORY}"
                exit 1
            end

            @data = Tomlrb.load_file cfg
        end

        def dig *args
            @data.dig *args
        end

        def path str, absolute=true
            if absolute
                File.join App::ROOT, @data['path'][str]
            else
                @data['path'][str]
            end
        end
    end
end