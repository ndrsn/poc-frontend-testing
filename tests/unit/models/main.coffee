sinon = require 'sinon'
chai = require 'chai'
chai.should()
expect = chai.expect

sandbox = require 'sandboxed-module'

configMock =
	foo: false
	bar: true

describe 'Main Model', ->
	it 'should quack true', ->
		MainModel = require '../../../src/coffee/models/main'
		m = new MainModel
		m.quack().should.equal "Quack true"

	it 'with mocked config should quack false', ->
		MainModel = sandbox.require '../../../src/coffee/models/main',
			requires:
				'../config.coffee': configMock

		m = new MainModel
		m.quack().should.equal "Quack false"