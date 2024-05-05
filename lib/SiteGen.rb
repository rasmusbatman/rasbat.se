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
require_relative './SiteGen/Parse/metadata'
require_relative './SiteGen/Data'
require_relative './SiteGen/Pipeline'

def SiteGen::build

    data = SiteGen::Data.new
    
    puts data.get :navbar

    # ...
end

def SiteGen::clean
    # ...
end