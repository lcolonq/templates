mod game;

#[cfg(not(target_arch = "wasm32"))]
#[tokio::main]
pub async fn main() {
    teleia::run("game", game::Game::new).await;
}

#[cfg(target_arch = "wasm32")]
pub fn main() {} // dummy main, real wasm32 main is lib::main_js
