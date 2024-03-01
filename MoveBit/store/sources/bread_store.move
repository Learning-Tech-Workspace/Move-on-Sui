module store::bread_store {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;

    struct Sandwich has key {
        id: UID
    }

    public entry fun buy_sandwich(ctx: &mut TxContext) {
        let sandwich = Sandwich {
            id: object::new(ctx)
        };
        transfer::transfer(sandwich, sender(ctx));
    }
}