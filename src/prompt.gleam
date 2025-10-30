import lustre/element.{type Element}
import lustre/element/html
import lustre/attribute

pub fn element(child: Element(a)) {
  html.div([
    attribute.class("prompt")
  ], [
    html.span([
      attribute.class("bg")
    ], [
      html.text("\u{00A0}~\u{00A0}"),
    ]),
    html.text(""),
    child
  ])
}
