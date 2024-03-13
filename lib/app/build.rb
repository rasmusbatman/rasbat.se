# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    def build
        @logger.info 'Building...'

        if File.exist? @config.path(App::OUTPUT)
            @logger.info 'The target directory exists.'

            self.clean
        end

        @logger.info 'Copying static files to target directory...'

        FileUtils.cp_r @config.path(App::STATIC), @config.path(App::OUTPUT)

        @logger.info 'Processing routes...'

        self._find_routes.each { |path| self._process_route path }

        @logger.info 'Done building!'
    end

    private

    def _process_route path
        route = App::Route.new path, @config

        puts route.document.meta.generator
    end
end