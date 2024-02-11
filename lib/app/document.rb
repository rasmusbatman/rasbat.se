# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

require_relative 'document/meta'

class App
    class Document
        attr_reader :hash
        attr_reader :title
        attr_reader :description
        attr_reader :keywords
        attr_reader :author
        attr_reader :meta

        def initialize hash
            @hash = hash
            @title = hash.dig :document, :title
            @description = hash.dig :document, :description
            @keywords = hash.dig :document, :keywords
            @author = hash.dig :document, :author
            @meta = App::Document::Meta.new self
            @favicon = hash.dig :document, :favicon
        end

        def favicon?
            !!@favicon
        end
    end
end