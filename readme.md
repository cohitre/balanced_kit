[![Build Status](https://travis-ci.org/balanced/balanced_kit.svg)](https://travis-ci.org/balanced/balanced_kit)

# BalancedKit

BalancedKit is a Javascript library to access your Balanced Payments data from
your administrator dashboard. It includes UI Widgets to simplify data rendering
and to help with common administrator and debugging tasks.

## Development

BalancedKit is built using broccoli and grunt.

```
npm install
bower install
```

There is a broccoli server that is builds the project and creates some html files
that are useful for previewing your work from `http://localhost:4200`

```
broccoli serve
```

## Testing

BalancedKit uses Jasmine for testing code. The broccoli server provides access
to the tests suite in `http://localhost:4200/specs` and there's also a grunt watch
task that runs the tests continuosly:

```
grunt watch
```

## connection


All API calls are made through a service object.

```coffee
service = BalancedKit.service("ak-secret-xxxxxxxxxxxxxxxxxxx")

service.transactions()
  .sort("created_at", "descending")
  .type("debit")
  .status(["failed", "pending"])
  .range(undefined, new Date())
  .start()
  .then (transactions) ->
    transactions.total() # => 100
    transactions.getItems().debits.length # => 10
    transactions.next()
  .then (transaction) ->
    transactions.total() # => 100
    transactions.getItems().debits.length # => 10


service.transactions()
  .attr(
    sort: ["created_at", "descending"]
    type: "debit"
    status: ["failed", "pending"],
    range: [undefined, new Date()],
  )
  .start()

```

```hbs
{{view Balanced.Views.DescriptionList data=marketplace dataTemplate="marketplace"}}
```
