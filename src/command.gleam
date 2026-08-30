pub type Command {
  Command(name: String, run: fn(List(String)) -> #(String, Int))
}
