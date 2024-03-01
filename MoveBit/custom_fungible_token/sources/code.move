module custom_fungible_token::SCC {
    use sui::coin::{create_currency};
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    struct SCC has drop {}

    fun init(witness: SCC, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = create_currency<SCC>(witness, 9, b"SCC", b"Sui Course Coin", b"Sui course Coin", option::none(), ctx);
        transfer::public_freeze_object(metadata); // immutable object
        transfer::public_transfer(treasury_cap, sender(ctx));
    }
}