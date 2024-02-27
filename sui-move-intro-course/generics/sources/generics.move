module generics::storage {
    struct Box<T> {
        value: T
    }

    public fun create_box<T>(value: T): Box<T> {
        Box<T> {value}
    }

    public fun create_box(value: u64): Box<u64> {
        Box<u64> {value}
    }
}