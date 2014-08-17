`import BaseModel from "./base_model"`
`import BalancedApiResponseHandler from "./balanced_api_response_handler"`
`import BankAccount from "./bank_account"`

###
    BalancedKit.marketplace("xxxxxxxxxxxxx")
      .transaction(type, customer, funding_instrument, information)
      .debit(customer, funding_instrument, information).save()
      .debit(customer, funding_instrument, information).validate()
      .customer().debit(funding_instrument, information)
###


# BalancedKit.Models.Marketplace
#   .findByApiKey("xxxxxxxxx")
#
# marketplace.bankAccounts("/bank_accounts/BAXXXXXXXXXXXXXXXXXX")
# marketplace.bankAccounts()
#   .before(somDate)
#   .after(someDate)
#   .then (bankAccounts) ->
#
# marketplace.bankAccounts("/bank_accounts/SOMEID")
# marketplace.bankAccounts("SOMEID")
# marketplace.bankAccounts({
#   before: someDate
# })

getter = (attributeName) ->
  ->
    @get(attributeName)

class Marketplace extends BaseModel
  @findByApiKey: (apiKey) ->
    connection = new BalancedApiConnection(apiKey)
    connection
      .get("/marketplaces")
      .then (response) =>
        r = new BalancedApiResponseHandler(connection, response)
        r.getMarketplaces()[0]

  bankAccounts: (object) ->
    @link(BankAccount, "/bank_accounts", object)

  getName: getter("name")
  getDomainUrl: ->
    # Parse the domain_url and normalize it?
    @get("domain_url")

  getEscrowAmountInCents: getter("in_escrow")

  getSupportEmailAddress: getter("support_email_address")
  getSupportPhoneNumber: getter("support_phone_number")
  isProduction: getter("production")
  isTest: ->
    !@isProduction()

  getUnsettledFees: getter("unsettled_fees")
  getMeta: getter("meta")

`export { Marketplace };`
`export default Marketplace;`
