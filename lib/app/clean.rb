# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    def clean
        @logger.info 'Cleaning...'

        if !File.exist? @config.path(App::OUTPUT)
            @logger.info 'The target directory does not exist.'
        else
            FileUtils.rm_r @config.path(App::OUTPUT)
        end

        @logger.info 'Done cleaning!'
    end
end