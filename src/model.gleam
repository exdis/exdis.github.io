import gleam/list
import gleam/string
import lustre/effect.{type Effect}
import messages.{type Msg, UserInput, UserKeydown}

pub type Entry {
  Entry(status: Bool, command: String, output: String, valid_command: Bool)
}

pub type Model {
  Model(
    input: String,
    history: List(Entry),
    status: Bool,
    suggestion: String,
    valid_command: Bool,
  )
}

const commands = ["help", "about", "projects", "contact"]

@external(javascript, "./model_ffi.mjs", "preventTabDefault")
fn do_prevent_tab_default() -> Nil

@external(javascript, "./model_ffi.mjs", "setupFocus")
fn do_setup_focus() -> Nil

pub fn init(_args) -> #(Model, Effect(Msg)) {
  #(
    Model(
      input: "",
      history: [],
      status: True,
      suggestion: "",
      valid_command: False,
    ),
    effect.from(fn(_) {
      do_prevent_tab_default()
      do_setup_focus()
    }),
  )
}

pub fn update(model: Model, msg: Msg) {
  case msg {
    UserInput(str) -> {
      let suggestion = get_suggestion(str)
      let valid = is_valid_command(str)
      #(
        Model(..model, input: str, suggestion: suggestion, valid_command: valid),
        effect.none(),
      )
    }
    UserKeydown(key) -> {
      case key {
        "Enter" -> run_command(model)
        "Tab" -> tab_complete(model)
        _ -> #(model, effect.none())
      }
    }
  }
}

fn tab_complete(model: Model) {
  case model.input {
    "" -> #(model, effect.none())
    prefix -> {
      let matches =
        list.filter(commands, fn(cmd) { string.starts_with(cmd, prefix) })
      case matches {
        [] -> #(model, effect.none())
        [single] -> #(
          Model(..model, input: single, suggestion: "", valid_command: True),
          effect.none(),
        )
        [first, ..rest] -> {
          let common = find_common_prefix(first, rest)
          let suggestion = get_suggestion(common)
          let valid = is_valid_command(common)
          #(
            Model(
              ..model,
              input: common,
              suggestion: suggestion,
              valid_command: valid,
            ),
            effect.none(),
          )
        }
      }
    }
  }
}

fn find_common_prefix(base: String, others: List(String)) -> String {
  list.fold(others, base, fn(acc, other) { common_prefix_of_two(acc, other) })
}

fn get_suggestion(input: String) -> String {
  case input {
    "" -> ""
    prefix -> {
      let match =
        list.find(commands, fn(cmd) { string.starts_with(cmd, prefix) })
      case match {
        Ok(cmd) -> string.drop_start(cmd, string.length(prefix))
        Error(_) -> ""
      }
    }
  }
}

fn is_valid_command(input: String) -> Bool {
  list.contains(commands, input)
}

fn common_prefix_of_two(a: String, b: String) -> String {
  do_common_prefix(string.to_graphemes(a), string.to_graphemes(b), "")
}

fn do_common_prefix(a: List(String), b: List(String), acc: String) -> String {
  case a, b {
    [x, ..rest_a], [y, ..rest_b] ->
      case x == y {
        True -> do_common_prefix(rest_a, rest_b, acc <> x)
        False -> acc
      }
    _, _ -> acc
  }
}

fn run_command(model: Model) {
  let help =
    "
  Available commands:

    help       Display this help message
    about      Learn more about this site
    projects   View ongoing projects
    contact    Contact the site owner

  Note: All commands are currently under construction.
        Please check back soon for updates.\n\n"
  let #(output, status) = case model.input {
    "help" -> #(help, True)
    "" -> #("", True)
    _ -> #("Command not found!\n", False)
  }

  let entry =
    Entry(
      status: model.status,
      command: model.input,
      output: output,
      valid_command: model.valid_command,
    )

  #(
    Model(
      input: "",
      history: list.append(model.history, [entry]),
      status: status,
      suggestion: "",
      valid_command: False,
    ),
    effect.from(fn(_) { do_setup_focus() }),
  )
}
