import lustre/attribute
import lustre/element/html
import lustre/event
import model.{type Model}
import messages.{UserInput, UserKeydown}

pub fn element(model: Model) {
  html.input([
    attribute.value(model.input),
    event.on_input(UserInput),
    event.on_keydown(UserKeydown)
  ])
}
