
pub contract CarbonCredit {
    pub var totalSupply: UInt64
    pub resource NFT {
        pub let id: UInt64
        pub var description: String
        pub var credits: UInt64
        pub var patrimonyRegisterNumber: String

        init(description: String, credits: UInt64, patrimonyRegisterNumber: String) {
            self.id = CarbonCredit.totalSupply
            CarbonCredit.totalSupply = CarbonCredit.totalSupply + (1 as UInt64)
            self.description = description
            self.credits = credits
            self.patrimonyRegisterNumber = patrimonyRegisterNumber
        }
    }

    pub resource interface CollectionPublic {
        pub fun getIDs(): [UInt64]
    }
    
    pub resource Collection: CollectionPublic {
        pub var ownedNFTs: @{ UInt64: NFT }
    

        pub fun deposit(token: @NFT) {
            self.ownedNFTs[token.id] <-! token
        }

        pub fun withdraw(id: UInt64): @NFT {
            let token <- self.ownedNFTs.remove(key: id) ?? panic("This collection doesn't contain NFTthth that ID")
            return <- token
        }

        pub fun getIDs(): [UInt64] {
            return self.ownedNFTs.keys
        }

        init() {
            self.ownedNFTs <- {}
        }

        destroy() {
            destroy self.ownedNFTs
        }

    }

    pub fun createCollection(): @Collection {
        return <- create Collection()
    }
    
    pub fun createNFT(description: String, credits: UInt64, patrimonyRegisterNumber: String): @NFT {
        return <- create NFT(
            description: description,
            credits: credits,
            patrimonyRegisterNumber: patrimonyRegisterNumber
        )
    }
    
    init() {
        self.totalSupply = 0
    }
}
 