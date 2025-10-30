import gleam/list
import lustre/effect.{type Effect}
import messages.{type Msg, UserInput, UserKeydown}

pub type Model {
  Model(
    input: String,
    output: List(#(String, String, Bool)),
  )
}

pub fn init(_args) -> #(Model, Effect(Msg)) {
  #(Model("", [#("", "", True)]), effect.none())
}

pub fn update(model: Model, msg: Msg) {
  case msg {
    UserInput(str) -> #(Model(..model, input: str), effect.none())
    UserKeydown(key) -> {
      case key {
        "Enter" -> run_command(model)
        _ -> #(model, effect.none())
      }
    }
  }
}

fn run_command(model: Model) {

  let help = "
  Available commands:

    help       Display this help message
    about      Learn more about this site
    projects   View ongoing projects
    contact    Contact the site owner

  Note: All commands are currently under construction.
        Please check back soon for updates.\n\n"
  let #(output, status) = case model.input {
    "help" -> #(help, True)
    _ -> #("Command not found!\n", False)
  }

  #(
    Model(
      "",
      list.append(model.output, [#(
        model.input,
        output,
        status
      )]),
    ),
    effect.none()
  )
}

