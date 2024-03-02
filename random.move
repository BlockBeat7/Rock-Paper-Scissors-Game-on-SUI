mod sicbogame::random {
    use std::hash;
    use std::vector;
    use sui::bcs;
    use sui::object;
    use sui::tx_context::TxContext;

    const ERR_HIGH_ARG_GREATER_THAN_LOW_ARG: u64 = 101;

    fn seed(ctx: &mut TxContext) -> vector<u8> {
        let ctx_bytes = bcs::to_bytes(ctx);
        let uid = object::new(ctx);
        let uid_bytes: vector<u8> = object::uid_to_bytes(&uid);
        object::delete(uid);

        let mut info: vector<u8> = vector::empty<u8>();
        vector::append(&mut info, &ctx_bytes);
        vector::append(&mut info, &uid_bytes);

        let hash: vector<u8> = hash::sha3_256(info);
        hash
    }

    fn bytes_to_u64(bytes: vector<u8>) -> u64 {
        let mut value = 0u64;
        let mut i = 0u64;
        while i < 8 {
            value = value | ((*vector::borrow(&bytes, i) as u64) << ((8 * (7 - i)) as u8));
            i = i + 1;
        }
        value
    }

    /// Generate a random u64
    fn rand_u64_with_seed(_seed: vector<u8>) -> u64 {
        bytes_to_u64(_seed)
    }

    /// Generate a random integer range in [low, high).
    fn rand_u64_range_with_seed(_seed: vector<u8>, low: u64, high: u64) -> u64 {
        assert!(high > low, ERR_HIGH_ARG_GREATER_THAN_LOW_ARG);
        let value = rand_u64_with_seed(_seed);
        (value % (high - low)) + low
    }

    /// Generate a random u64
    pub fn rand_u64(ctx: &mut TxContext) -> u64 {
        rand_u64_with_seed(seed(ctx))
    }

    /// Generate a random integer range in [low, high).
    pub fn rand_u64_range(low: u64, high: u64, ctx: &mut TxContext) -> u64 {
        rand_u64_range_with_seed(seed(ctx), low, high)
    }
}
