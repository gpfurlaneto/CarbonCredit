import CarbonCredit from "../contracts/CarbonCredit.cdc"

transaction(description: String, credits: UInt64, patrimonyRegisterNumber: String) {

  prepare(acct: AuthAccount) {
    let aReferenceToCollection = acct.borrow<&CarbonCredit.Collection>(from: /storage/Collection)
                ?? panic("Nothing exists here! You don't have a collection")
                        
    aReferenceToCollection.deposit(token: <- CarbonCredit.createNFT(
      description: description,
      credits: credits,
      patrimonyRegisterNumber: patrimonyRegisterNumber
    ))
    
   
  }

  execute {
    log("Stored newly minted NFT into a collection")
  }
}
 