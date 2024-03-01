module card_game::card_game {
    use sui::object::{Self, UID};
    use std::string::{Self, String};
    use std::vector;

    struct Card has key, store {
        id: UID,
    }

    struct Player has key {
        id: UID,
    }
}