# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

require 'erb'

require 'tomlrb'
require 'redcarpet'
require 'sassc'

class App
    ROOT = __dir__[0..-5] # cut off /lib
    VERSION = File.read File.join( App::ROOT, 'VERSION' )
    REPOSITORY = 'https://github.com/rasmusbatman/rasbat.se'

    attr_reader :config

    def initialize
        @config = Tomlrb.load_file File.join( App::ROOT, 'config.toml' )
    end

    def build
        raise NotImplementedError
    end

    def clean
        raise NotImplementedError
    end

    private

    # build steps...
    # - check that out does not exist
    # - copy over static
    # - gather routes
    # - compile route configs
    # - compile routes
    #
    # logic is handled in routes (whether that be .rb or .erb)
end

require_relative 'app/document'