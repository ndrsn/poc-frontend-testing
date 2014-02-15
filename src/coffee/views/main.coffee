Backbone = require 'backbone'

module.exports = class MainView extends Backbone.View
	initialize: ->
		@model.quack()
		@render()

	render: ->
		@$el.html '<h1>App Main View</h1>'
		@$el.append @model.get 'foo'