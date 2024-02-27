module intro_nft::nft {
    use sui::object::{Self, UID, ID};
    use sui::url::{Self, Url};
    use std::string::{String};
    use sui::tx_context::{TxContext, sender};
    use sui::event::emit;
    use sui::transfer;

    struct NFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url
    }

    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String
    }
    
    // differ from MoveBit
    public fun get_nft_name(nft: &NFT, _: &mut TxContext): String {
        nft.name
    }

    public fun get_nft_description(nft: &NFT, _: &mut TxContext): String {
        nft.description
    }

    public fun get_nft_url(nft: &NFT, _: &mut TxContext): Url {
        nft.url
    }

    public entry fun mint_nft(name: String, description: String, url: vector<u8>, ctx: &mut TxContext) {
        let nft = NFT {
            id: object::new(ctx),
            name: name,
            description: description,
            url: url::new_unsafe_from_bytes(url)
        };

        emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: name
        });

        transfer::public_transfer(nft, sender(ctx));       
    }

    public entry fun transfer(nft: NFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(nft: &mut NFT, description: String, _: &mut TxContext) {
        nft.description = description;
    }

    public entry fun burn(nft: NFT, _: &mut TxContext) {
        let NFT {id, name: _, description: _, url: _} = nft;
        object::delete(id);
    }
}