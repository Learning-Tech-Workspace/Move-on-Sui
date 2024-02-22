module counter::counter {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct CreatorCap has key {
        id: UID
    }

    
    fun init(ctx: &mut TxContext) {
        transfer::transfer(CreatorCap {
            id: object::new(ctx),
        }, tx_context::sender(ctx))
    }
}