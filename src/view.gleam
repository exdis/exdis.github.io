import lustre/element
import model.{type Model}
import banner
import prompt
import input

pub fn view(model: Model) {
  element.fragment([
    banner.element(),
    prompt.element(),
    input.element(model),
  ])
}

