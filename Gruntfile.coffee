module.exports = (grunt) ->
	require('load-grunt-tasks') grunt

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		express:
			all:
				options:
					port: 9000
					hostname: '0.0.0.0'
					bases: ["#{__dirname}/build"]
		open:
			all:
				path: 'http://localhost:<%= express.all.options.port %>'

		jade:
			build:
				options:
					client: true
					namespace: 'templates'
					node: true
				files:
					'src/templates/.templates.js': ['src/templates/**/*.jade', '!src/templates/index.jade']
			index:
				files:
					'build/index.html': ['src/templates/index.jade']

		stylus:
			build:
				options:
					paths: ['src/styles/import']
					import: ['variables.styl']
				files:
					'build/style.css':  [
						'src/styles/**/*.styl'
						'!src/styles/import/*.styl'
					]

		browserify:
			build:
				src: 'src/coffee/app.coffee'
				dest: 'build/main.js'
			options:
				transform: ['coffeeify']

		watch:
			options:
				nospawn: true
				livereload: true
			coffee:
				files: ['src/coffee/**/*.coffee']
				tasks: ['browserify']
			templates:
				files: ['src/templates/**/*.jade']
				tasks: ['jade:build']
			index:
				files: ['src/templates/index.jade']
				tasks: ['jade:index']
			styles:
				files: ['src/styles/**/*.styl']
				tasks: ['stylus:build']

	grunt.registerTask 'default', ['watch']
	grunt.registerTask 'build', ['browserify']
	grunt.registerTask 'server', ['express', 'open', 'express-keepalive']