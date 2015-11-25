chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'gitlab', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/gitlab')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/gitlab list projects/i)
  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/gitlab list users/i)
  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/gitlab show user ([\w\.\-_ ]+)(, (.+))?/i)
  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/gitlab show project ([\w\.\-_ ]+)(, (.+))?/i)
