import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import model
import parser

pub fn element(input: String) -> Element(a) {
  element.fragment(
    list.map(parser.parse_spans(input), fn(span) {
      let #(text, is_command) = span
      case is_command && model.is_command(text) {
        True -> html.span([attribute.class("valid-command")], [html.text(text)])
        False -> html.text(text)
      }
    }),
  )
}
