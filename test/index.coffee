should = require 'should'
{validate} = require('json-schema')

{getAccountStats} = require '../lib'
responseSchema = require '../lib/response.schema'

describe 'scrape account stats', ->
  it 'should return properly structured data', ->
    getAccountStats(username: 'slang800').then((account) ->
      validate(account, responseSchema).errors.should.eql([])
    )
