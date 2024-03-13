# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

require 'logger'
require 'erb'
require 'fileutils'

require 'tomlrb'
require 'redcarpet'
require 'rouge'
require 'sassc'

require_relative 'hash'

require_relative 'app/logger'
require_relative 'app/config'

class App
    ROOT = __dir__[0..-5] # cut off /lib
    VERSION = File.read File.join( App::ROOT, 'VERSION' )
    REPOSITORY = 'https://github.com/rasmusbatman/rasbat.se'

    LOG_PATH = 'app.log'
    CFG_PATH = 'config.toml'

    attr_reader :logger
    attr_reader :config

    def initialize
        FileUtils.rm App::LOG_PATH

        @logger = App::Logger.new(App::LOG_PATH)
        @config = App::Config.new
    end

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
require_relative 'app/route'
require_relative 'app/clean'
require_relative 'app/build'