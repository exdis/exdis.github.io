import lustre/element/html
import lustre/attribute
import model.{type Model}
import input

pub fn element(model: Model) {
  html.div([
    attribute.class("prompt")
  ], [
    html.span([
      attribute.class("bg")
    ], [
      html.text("\u{00A0}~\u{00A0}"),
    ]),
    html.text(""),
    input.element(model)
  ])
}
