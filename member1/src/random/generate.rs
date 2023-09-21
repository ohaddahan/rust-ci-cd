use rand::prelude::*;

pub fn generate_random_number() -> u8 {
    let mut rng = rand::thread_rng();
    rng.gen_range(1.. 101)
}
