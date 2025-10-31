import banner
import input
import lustre/element
import model.{type Model}
import output
import prompt

pub fn view(model: Model) {
  element.fragment([
    banner.element(),
    output.element(model),
    prompt.element(input.element(model), True),
  ])
}
