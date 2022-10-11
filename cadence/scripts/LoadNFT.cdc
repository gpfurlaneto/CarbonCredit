import CarbonCredit from "../contracts/CarbonCredit.cdc"

pub fun main(account: Address): [UInt64] {
    let publicReference = getAccount(account).getCapability(/public/Collection)
              .borrow<&CarbonCredit.Collection{CarbonCredit.CollectionPublic}>()
                    ?? panic("This account does not have a collection")

    return publicReference.getIDs()
}