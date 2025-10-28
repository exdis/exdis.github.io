import lustre
import lustre/element
import banner
import prompt

pub fn main() {
  let app = lustre.element(element.fragment([
    banner.element(),
    prompt.element()
  ]))
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
