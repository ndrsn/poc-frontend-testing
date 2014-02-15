Backbone = require 'backbone'

config = require '../config.coffee'

class MainModel extends Backbone.Model
	defaults:
		foo: 'bar'
		baz: 'quux'
	
	quack: ->
		"Quack #{config.foo}"

module.exports = MainModel