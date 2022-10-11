import CarbonCredit from "../contracts/CarbonCredit.cdc"

transaction {

  prepare(acct: AuthAccount) {
    log("passou aqui")
    let aReferenceToCollection = acct.borrow<&CarbonCredit.Collection>(from: /storage/Collection)
                ?? panic("Nothing exists here! You don't have a collection")
                        
    aReferenceToCollection.deposit(token: <- CarbonCredit.createNFT())
    
   
  }

  execute {
    log("Stored newly minted NFT into a collection")
  }
}
 