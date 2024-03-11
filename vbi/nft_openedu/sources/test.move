#[test_only]
module openedu::nft_for_test {
    use openedu::nft::{Self, NFT};
    use sui::transfer;
    use sui::test_scenario as ts;
    use std::string;

    #[test]
    fun mint_test() {
        let addr1 = @0xA;
        let addr2 = @0xB;

        // create scenario (context) for testing
        let scenario = ts::begin(addr1); // addr1 is the one who calls the function
            { 
                let nft = nft::mint_for_test(
                    b"name", 
                    b"link", 
                    b"image_url", 
                    b"description", 
                    b"creator", 
                    ts::ctx(&mut scenario));
                transfer::public_transfer(nft, addr1);
            };

        // Execute next function
        ts::next_tx(&mut scenario, addr1);
            {
                let nft = ts::take_from_sender<NFT>(&mut scenario); // sender: addr1
                transfer::public_transfer(nft, addr2);
            };

        ts::next_tx(&mut scenario, addr2);
        {
            let nft = ts::take_from_sender<NFT>(&mut scenario); // sender: addr2
            nft::update_name(&mut nft, b"new name");
            assert!(*string::bytes(nft::get_name(&nft)) == b"new name", 0); // * to dereference (get value of reference)
            ts::return_to_sender(&mut scenario, nft);
        };

        // End scenario
        ts::end(scenario);
    }
}