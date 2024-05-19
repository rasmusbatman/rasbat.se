# stdlib
require 'tmpdir'
require 'json'

# external gems
require 'tomlrb'

$ROOT = File.absolute_path("#{File.join(__dir__, '..')}#{File::SEPARATOR}")
$CONFIG = Tomlrb.load_file(File.join($ROOT, 'config.toml'), symbolize_keys: true)
$VERSION = File.read(File.join($ROOT, 'VERSION'))

class SiteGen end

# local gems
require_relative './SiteGen/Exception'
require_relative './SiteGen/Pipeline'
require_relative './SiteGen/Route'
require_relative './SiteGen/Metadata'
require_relative './SiteGen/Data'

def SiteGen::build

    test = SiteGen::Route.new

    # ...

end

def SiteGen::clean

    # ...

end