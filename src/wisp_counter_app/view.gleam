import gleam/int
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

// State of the counter
pub type Model =
  Int

// Actions to update the state
pub type Msg {
  Increment
  Decrement
}

// Update logic
pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Increment -> model + 1
    Decrement -> model - 1
  }
}

// HTML View using Lustre
pub fn view(model: Model) -> Element(Msg) {
  html.div([], [
    html.button([event.on_click(Decrement)], [element.text("-")]),
    html.span([], [element.text(int.to_string(model))]),
    html.button([event.on_click(Increment)], [element.text("+")]),
  ])
}
