module openedu::nft {
    friend openedu::nft_box;

    use sui::object::{Self, UID};
    use std::string::{Self, String};
    use sui::url::{Self, Url};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;

    struct NFT has key, store {
        id: UID,
        name: String,
        link: Url,
        image_url: Url,
        description: String,
        creator: String,
    }

    
    public(friend) fun mint(_name: String, _link: vector<u8>, _image_url: vector<u8>, _description: vector<u8>, _creator: vector<u8>, ctx: &mut TxContext) {
        let nft = NFT {
            id: object::new(ctx),
            name: _name,
            link: url::new_unsafe_from_bytes(_link),
            image_url: url::new_unsafe_from_bytes(_image_url),
            description: string::utf8(_description),
            creator: string::utf8(_creator),
        };
        transfer::transfer(nft, sender(ctx));
    }
}