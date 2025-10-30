import gleam/string
import gleam/list
import lustre/element
import lustre/element/html
import lustre/attribute
import model.{type Model}
import prompt

pub fn element(model: Model) {
  element.fragment(
    list.map(model.output, fn(output) {
      let #(command, output, status) = output

      case string.is_empty(output) {
        False -> html.div(
          [attribute.class("output")],
          [ html.div([], [prompt.element(
            html.span(
              [ attribute.class("command") ],
              [
                html.text(" " <> command),
                html.pre([], [html.text(output)])
              ]
            )
          )]) ]
          )
        True -> element.none()
      }
    })
  )
}
