import CarbonCredit from "../contracts/CarbonCredit.cdc"

transaction {

  prepare(acct: AuthAccount) {
    acct.save(<- CarbonCredit.createCollection(), to: /storage/Collection)
    acct.link<&CarbonCredit.Collection{CarbonCredit.CollectionPublic}>(/public/Collection, target: /storage/Collection)
  }

  execute {
    log("Stored a collection for CarbonCredit")
  }
}
