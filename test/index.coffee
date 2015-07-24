should = require 'should'
fs = require 'fs'
path = require 'path'
{validate} = require('json-schema')

{getAccountStats} = require '../lib'

describe 'post stream', ->
  it 'should return properly structured data', ->
    getAccountStats(username: 'slang800').then((account) ->
      validate(
        account
        JSON.parse(
          fs.readFileSync(path.join(__dirname, '../lib/response.schema.json'))
        )
      ).errors.should.eql([])
    )
