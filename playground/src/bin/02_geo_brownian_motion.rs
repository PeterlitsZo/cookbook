use rand_distr::{Distribution, Normal};

fn geo_brownian_motion(steps: usize, mu: f64, sigma: f64, s0: f64) -> Vec<f64> {
    let mut rng = rand::rng();

    let normal = Normal::new(0.0, 1.0).unwrap();
    let mut bm = vec![s0];

    for _ in 0..steps {
        let z = normal.sample(&mut rng);
        let last_val = bm.last().unwrap();

        let drift = mu - 0.5 * sigma.powi(2);
        let diffusion = sigma * z;
        let new_val = last_val * (drift + diffusion).exp();

        bm.push(new_val);
    }

    bm
}

#[tokio::main]
async fn main() {
    let mu = (0.08 / 242.0) / 14400.0;
    let sigma = ((0.1 / 242.0) / 14400.0 as f64).sqrt();
    let s0 = 3346.72;
    let data = geo_brownian_motion(14400, mu, sigma, s0);
    playground::build_public_as_line_chart(data);
    playground::serve_public().await;
}