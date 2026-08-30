import command.{type Command, Command}
import gleam/string

pub fn help() -> Command {
  let help =
    "
  Available commands:

    help       Display this help message
    about      Learn more about this site
    projects   View ongoing projects
    contact    Contact the site owner

  Note: All commands are currently under construction.
        Please check back soon for updates.\n\n"

  Command(name: "help", run: fn(args) {
    case args {
      [] -> #(help, 0)
      _ -> #("Invalid argument(s): " <> string.join(args, ", ") <> "\n", 1)
    }
  })
}
