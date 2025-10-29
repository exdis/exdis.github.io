import gleam/io
import gleam/list
import lustre/element
import lustre/effect.{type Effect}
import messages.{type Msg, UserInput, UserKeydown}

pub type Model {
  Model(
    input: String,
    output: List(String)
  )
}

pub fn init(_args) -> #(Model, Effect(Msg)) {
  #(Model("", []), effect.none())
}

pub fn update(model: Model, msg: Msg) {
  case msg {
    UserInput(str) -> #(Model(..model, input: str), effect.none())
    UserKeydown(key) -> {
      case key {
        "Enter" -> #(
          Model(
            ..model,
            input: "",
            output: list.append(model.output, [run_command(model.input)])
          ),
          effect.none()
        )
        _ -> #(model, effect.none())
      }
    }
  }
}

fn run_command(command: String) {
  let help = "
  Available commands:

    help       Display this help message
    about      Learn more about this site
    projects   View ongoing projects
    contact    Contact the site owner

  Note: All commands are currently under construction.
        Please check back soon for updates.\n\n"
  case command {
    "help" -> help
    _ -> "Command not found!\n"
  }
}

