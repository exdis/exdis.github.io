import gleam/list
import lustre/element/html
import lustre/attribute
import model.{type Model}

pub fn element(model: Model) {
  html.pre(
    [attribute.class("output")],
    model.output
    |> list.map(html.text)
  )
}
