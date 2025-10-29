import lustre/element
import model.{type Model}
import banner
import output
import prompt

pub fn view(model: Model) {
  element.fragment([
    banner.element(),
    output.element(model),
    prompt.element(model),
  ])
}

