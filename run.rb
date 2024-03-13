#!/usr/bin/ruby

require File.join __dir__, 'lib', 'app'

h = {
    document: {
        lang: 'sv',
        title: 'my awesome document',
        keywords: [
            'one',
            'two',
            'three'
        ],
        robots: {
            index: true,
            follow: false
        },
        favicon: '/favicon.ico'
    }
}

app = App.new

app.build

#route = App::Route.new "/test/path/thing.rb"

"""
d = App::Document.new h

puts d.title

puts d.meta.robots
"""