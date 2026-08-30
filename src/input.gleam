import gleam/int
import gleam/string
import highlight
import lustre/attribute
import lustre/element
import lustre/element/html
import lustre/event
import messages.{UserInput, UserKeydown}
import model.{type Model}

pub fn element(model: Model) {
  let cursor_offset = int.to_string(string.length(model.input))
  html.span([attribute.class("input-wrapper")], [
    html.input([
      attribute.id("terminal-input"),
      attribute.value(model.input),
      attribute.attribute("autofocus", "true"),
      event.on_input(UserInput),
      event.on_keydown(UserKeydown),
    ]),
    html.span([attribute.class("input-text")], [highlight.element(model.input)]),
    html.span(
      [
        attribute.class("cursor"),
        attribute.style("left", cursor_offset <> "ch"),
      ],
      [],
    ),
    case model.suggestion {
      "" -> element.none()
      suggestion ->
        html.span(
          [
            attribute.class("suggestion"),
            attribute.style("left", cursor_offset <> "ch"),
          ],
          [html.text(suggestion)],
        )
    },
  ])
}
