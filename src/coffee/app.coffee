$ = require 'jquery'

$ ->
	MainView = require './views/main.coffee'
	MainModel = require './models/main.coffee'

	app = new MainView
		el: '#app'
		model: new MainModel