import lustre/element
import lustre/effect.{type Effect}
import messages.{type Msg, UserInput}

pub type Model {
  Model(input: String)
}

pub fn init(_args) -> #(Model, Effect(Msg)) {
  #(Model(""), effect.none())
}

pub fn update(_model: Model, msg: Msg) {
  case msg {
    UserInput(str) -> #(Model(str), effect.none())
  }
}

