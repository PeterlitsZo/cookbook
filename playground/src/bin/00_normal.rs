use rand_distr::{Distribution, Normal};

fn main() {
    let normal = Normal::new(0.0, 1.0).unwrap();
    let v = normal.sample(&mut rand::rng());
    println!("{} is from a N(0, 1) distribution", v);
}