# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

require_relative 'document/meta'

class App
    class Document
        attr_reader :data
        attr_reader :title
        attr_reader :description
        attr_reader :keywords
        attr_reader :author
        attr_reader :meta

        def initialize data
            @data = data
            @title = data.dig 'document', 'title'
            @description = data.dig 'document', 'description'
            @keywords = data.dig 'document', 'keywords'
            @author = data.dig 'document', 'author'
            @meta = App::Document::Meta.new self
            @favicon = data.dig 'document', 'favicon'
        end

        def favicon?
            !!@favicon
        end
    end
end