Backbone = require 'backbone'

class MainModel extends Backbone.Model
	defaults:
		foo: 'bar'
		baz: 'quux'

module.exports = MainModel