# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

class App
    class Document
        class Meta
            attr_reader :lang
            attr_reader :title
            attr_reader :description
            attr_reader :keywords
            attr_reader :author
            attr_reader :robots
            attr_reader :generator

            def initialize document
                @lang = self._lang document.hash.dig(:document, :lang)
                @title = self._title document.title
                @description = _meta 'description', document.description
                @keywords = _meta 'keywords', self._keywords(document.keywords)
                @robots = _meta 'robots', self._robots(document.hash.dig(:document, :robots))
                @generator = _meta 'generator', self._generator
            end

            private

            def _meta name, content
                if not content
                    return nil
                else
                    "<meta name=\"#{name}\" content=\"#{content}\">"
                end
            end

            def _lang value
                value ? "<html lang=\"#{value}\">" : "<html>"
            end

            def _title value
                value ? "<title>#{value}</title>" : nil
            end

            def _keywords array
                array ? array.join(', ') : nil
            end
    
            def _robots hash
                hash ? "#{hash[:index] ? 'index' : 'noindex'}, #{hash[:follow] ? 'follow' : 'nofollow'}" : nil
            end
    
            def _generator
                "#{App::REPOSITORY} #{App::VERSION}"
            end
        end
    end
end