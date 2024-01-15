# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

require 'erb'

require 'tomlrb'
require 'redcarpet'

class App
    ROOT = __dir__[0..-5] # cut off /lib
    VERSION = File.read File.join( App::ROOT, 'VERSION' )
    REPOSITORY = 'https://github.com/rasmusbatman/rasbat.se'
end

require_relative 'app/document'