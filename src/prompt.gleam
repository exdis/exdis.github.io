import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn element(child: Element(a), status: Bool) {
  let normal_prompt =
    element.fragment([
      html.span([attribute.class("bg")], [
        html.text("\u{00A0}~\u{00A0}"),
      ]),
      html.text(""),
    ])
  let error_prompt =
    element.fragment([
      html.span([attribute.class("bg-error")], [
        html.text("\u{00A0}!\u{00A0}"),
      ]),
      html.span([attribute.class("bg")], [
        html.text(""),
        html.text("\u{00A0}~\u{00A0}"),
      ]),
      html.text(""),
    ])
  let prompt = case status {
    True -> normal_prompt
    False -> error_prompt
  }
  html.div([attribute.class("prompt")], [prompt, child])
}
