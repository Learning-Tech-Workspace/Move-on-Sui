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

    
    public(friend) fun mint(_name: vector<u8>, _link: vector<u8>, _image_url: vector<u8>, _description: vector<u8>, _creator: vector<u8>, ctx: &mut TxContext): NFT {
        NFT {
            id: object::new(ctx),
            name: string::utf8(_name),
            link: url::new_unsafe_from_bytes(_link),
            image_url: url::new_unsafe_from_bytes(_image_url),
            description: string::utf8(_description),
            creator: string::utf8(_creator),
        }
    }

    public fun update_name(nft: &mut NFT, _name: vector<u8>) {
        nft.name = string::utf8(_name);
    }

    public fun update_link(nft: &mut NFT, _link: vector<u8>) {
        nft.link = url::new_unsafe_from_bytes(_link);
    }

    public fun update_image_url(nft: &mut NFT, _image_url: vector<u8>) {
        nft.image_url = url::new_unsafe_from_bytes(_image_url);
    }

    public fun update_creator(nft: &mut NFT, _creator: vector<u8>) {
        nft.creator = string::utf8(_creator);
    }

    public fun get_name(nft: &NFT): &String {
        &nft.name
    }

    public fun get_link(nft: &NFT): &Url {
        &nft.link
    }

    public fun get_image_url(nft: &NFT): &Url {
        &nft.image_url
    }

    public fun get_description(nft: &NFT): &String {
        &nft.description
    }

    public fun get_creator(nft: &NFT): &String {
        &nft.creator
    }

    #[test_only]
    public fun mint_for_test(name: vector<u8>, link: vector<u8>, image_url: vector<u8>, description: vector<u8>, creator: vector<u8>, ctx: &mut TxContext): NFT {
        mint(name, link, image_url, description, creator, ctx)
        // transfer::transfer(nft, sender(ctx));
    }
}