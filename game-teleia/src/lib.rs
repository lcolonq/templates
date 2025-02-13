mod game;

#[cfg(target_arch = "wasm32")]
use wasm_bindgen::prelude::*;

#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub async fn main_js() {
    teleia::run(240, 160, game::Game::new).await;
}
