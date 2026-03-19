import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn element(child: Element(a), status: Bool) {
  let normal_prompt =
    element.fragment([
      html.span([attribute.class("bg")], [
        html.text("\u{00A0}~\u{00A0}"),
      ]),
      html.text("\u{E0B0}\u{00A0}"),
    ])
  let error_prompt =
    element.fragment([
      html.span([attribute.class("bg-error")], [
        html.text("\u{00A0}!\u{00A0}"),
      ]),
      html.span([attribute.class("bg")], [
        html.text("\u{E0B0}"),
        html.text("\u{00A0}~\u{00A0}"),
      ]),
      html.text("\u{E0B0}\u{00A0}"),
    ])
  let prompt = case status {
    True -> normal_prompt
    False -> error_prompt
  }
  html.div([attribute.class("prompt")], [prompt, child])
}
