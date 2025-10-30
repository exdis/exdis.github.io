import lustre/element
import model.{type Model}
import banner
import output
import prompt
import input

pub fn view(model: Model) {
  element.fragment([
    banner.element(),
    output.element(model),
    prompt.element(input.element(model)),
  ])
}

