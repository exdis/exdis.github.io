import gleam/list
import highlight
import lustre/attribute
import lustre/element
import lustre/element/html
import model.{type Model}
import prompt

pub fn element(model: Model) {
  element.fragment(
    list.map(model.history, fn(entry) {
      html.div([attribute.class("output")], [
        prompt.element(
          html.span([attribute.class("command")], [
            highlight.element(entry.command),
          ]),
          entry.status,
        ),
        html.pre([], [html.text(entry.output)]),
      ])
    }),
  )
}
