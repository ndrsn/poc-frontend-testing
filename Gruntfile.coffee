module.exports = (grunt) ->
	require('load-grunt-tasks') grunt

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		browserify:
			build:
				files:
					'build/main.js': ['src/coffee/**/*.js', 'src/coffee/**/*.coffee']
			options:
				transform: ['coffeeify']

		watch:
			options:
				nospawn: true
			files: ['src/coffee/**/*.coffee']
			tasks: ['browserify']

	grunt.registerTask 'default', ['watch']
	grunt.registerTask 'build', ['browserify']