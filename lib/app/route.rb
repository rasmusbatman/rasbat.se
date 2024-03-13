# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    class Route
        attr_reader :path
        attr_reader :data
        attr_reader :basename
        attr_reader :dirname
        attr_reader :extname
        attr_reader :document
    
        def initialize path, config
            @path = path
            @data = self._data config.data
            @basename = self._basename
            @dirname = self._dirname 
            @extname = self._extname
            @document = self._document
        end

        private

        def _basename
            File.basename @path, '.*'
        end

        def _dirname
            File.dirname @path
        end

        def _extname
            File.extname(@path)[1..-1]
        end

        def _document
            App::Document.new @data
        end

        def _data hash
            dir_data_path = File.join self._dirname, "__dir__.toml"
            file_data_path = File.join self._dirname, "#{self._basename}.toml"

            if File.exist? dir_data_path
                dir_data = Tomlrb.load_file dir_data_path
            end
            if File.exist? file_data_path
                file_data = Tomlrb.load_file file_data_path
            end

            if !(dir_data.nil? || file_data.nil?)
                merged = dir_data.deep_merge file_data
                return hash.deep_merge merged
            elsif !file_data.nil? && dir_data.nil?
                return hash.deep_merge file_data
            elsif file_data.nil? && !dir_data.nil?
                return hash.deep_merge dir_data
            else
                return hash
            end
        end
    end

    private

    def _find_routes
        supported_formats = ['md', 'rb', 'erb']
        search =
            File.join( @config.path(App::ROUTES), '**', '*' ) +
            ".{#{supported_formats.join(',')}}"

        Dir.glob(search)
    end
end