module section08::example {
    use sui::object::{Self, UID};
    use sui::tx_context::{TxContext, Self, sender};
    use sui::transfer;

    // Use this dependency to get a type wrapper for UTF-8 strings
    use std::string::{Self, String};

    /// A dummy Object that holds a String type
    struct Name has key, store {
        id: UID,

        /// Here it is - the String type
        name: String
    }

    /// Create a name Object by passing raw bytes
    // fun init(ctx: &mut TxContext){
    //     let user = Name {
    //         id: object::new(ctx),
    //         name: string::utf8(b"Alex")
    //     };
    //     transfer::public_transfer(user, sender(ctx));
    // }

    fun create_name(ctx: &mut TxContext): Name{
        Name {
            id: object::new(ctx),
            name: string::utf8(b"Alex")
        }
    }

    public fun transfer_user(ctx: &mut TxContext) {
        let user = create_name(ctx);
        transfer::public_transfer(user, sender(ctx));
    }

    entry fun new_user(ctx: &mut TxContext) {
         let user = Name {
            id: object::new(ctx),
            name: string::utf8(b"Alex")
        };
        transfer::public_transfer(user, sender(ctx));
    }
}