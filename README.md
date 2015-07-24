# Instagram Scrape Account Stats
[![Build Status](http://img.shields.io/travis/slang800/instagram-scrape-account-stats.svg?style=flat-square)](https://travis-ci.org/slang800/instagram-scrape-account-stats) [![NPM version](http://img.shields.io/npm/v/instagram-scrape-account-stats.svg?style=flat-square)](https://www.npmjs.org/package/instagram-scrape-account-stats) [![NPM license](http://img.shields.io/npm/l/instagram-scrape-account-stats.svg?style=flat-square)](https://www.npmjs.org/package/instagram-scrape-account-stats)

A tool for scraping public data from Instagram, without needing to get permission from Instagram. It scrapes the following fields:
- description
- followers
- following
- isExplicit
- isPrivate
- isVerified
- name
- posts
- userId
- username
- website

See `lib/response.schema.json` for further details.

## Example
### CLI
The CLI operates entirely over STDOUT, and will output the account stats as JSON.

```bash
$ instagram-scrape-account-stats -u slang800
{"description":null,"followers":21,"following":90,"isExplicit":false,"isPrivate":false,"isVerified":false,"name":"Sean Lang","userId":"465981344","username":"slang800","posts":2,"website":"http://slang.cx"}
```

### JavaScript Module
The following example is in CoffeeScript.

```coffee
{getAccountStats} = require 'instagram-scrape-account-stats'

getAccountStats(username: 'slang800').then((account) ->
  console.log "#{account.username} has #{account.followers} followers."
)
```

The following example is the same as the last one, but in JavaScript.

```js
var getAccountStats = require('instagram-scrape-account-stats').getAccountStats;

getAccountStats({username: 'slang800'}).then(function(account) {
  console.log(account.username + " has " + account.followers + " followers.");
});
```

## Why?
Instagram doesn't provide an open, structured, and machine readable API, so, we're forced to scrape their user-facing site.

## Caveats
- This is probably against the Instagram TOS, so don't use it if that sort of thing worries you.
- Whenever Instagram updates certain parts of their front-end this scraper will need to be updated to support the new API.
- You can't scrape protected accounts (cause it's not public duh).
