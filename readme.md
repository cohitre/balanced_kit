## Connections

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

