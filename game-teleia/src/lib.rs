#![allow(dead_code, unused_variables)]
use std::collections::HashMap;
use wasm_bindgen::prelude::*;
use teleia::*;

struct Assets {
    font: font::Font,
}

impl Assets {
    fn new(ctx: &context::Context) -> Self {
        Self {
            font: font::Font::new(ctx),
        }
    }
}

struct Game {
    assets: Assets,
}

impl Game {
    async fn new(ctx: &context::Context) -> Self {
        Self {
            assets: Assets::new(ctx),
        }
    }
}

impl teleia::state::Game for Game {
    fn initialize_audio(&self, ctx: &context::Context, st: &state::State, actx: &audio::Context) -> HashMap<String, audio::Audio> {
        HashMap::from_iter(vec![
            ("test".to_owned(), audio::Audio::new(&actx, include_bytes!("assets/audio/test.wav"))),
        ])
    }
    fn finish_title(&mut self, _st: &mut state::State) {}
    fn mouse_press(&mut self, _ctx: &context::Context, _st: &mut state::State) {}
    fn mouse_move(&mut self, _ctx: &context::Context, _st: &mut state::State, _x: i32, _y: i32) {}
    fn update(&mut self, _ctx: &context::Context, _st: &mut state::State) -> Option<()> {
        Some(())
    }
    fn render(&mut self, ctx: &context::Context, _st: &mut state::State) -> Option<()> {
        ctx.clear();
        self.assets.font.render_text(
            ctx,
            &glam::Vec2::new(0.0, 0.0),
            "hello computer",
        );
        Some(())
    }
}

#[wasm_bindgen]
pub async fn main_js() {
    teleia::run(Game::new).await;
}
