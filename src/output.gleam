import gleam/list
import lustre/attribute
import lustre/element
import lustre/element/html
import model.{type Model}
import prompt

pub fn element(model: Model) {
  element.fragment(
    list.map(model.history, fn(entry) {
      let cmd_class = case entry.valid_command {
        True -> "command valid-command"
        False -> "command"
      }
      html.div([attribute.class("output")], [
        prompt.element(
          html.span([attribute.class(cmd_class)], [
            html.text(entry.command),
          ]),
          entry.status,
        ),
        html.pre([], [html.text(entry.output)]),
      ])
    }),
  )
}
