import gleam/list
import gleam/string

pub type Invocation {
  Invocation(name: String, args: List(String))
}

pub fn parse(input: String) -> List(Invocation) {
  let splitted =
    input
    |> string.split(" ")
    |> list.filter(fn(item) { item != "" })
  case splitted {
    [] -> []
    [name, ..args] -> [Invocation(name, args)]
  }
}

pub fn parse_spans(input: String) -> List(#(String, Bool)) {
  let #(_, spans) =
    string.split(input, " ")
    |> list.map_fold(True, fn(expecting, word) {
      case word {
        "|" -> #(True, #(word, False))
        "" -> #(expecting, #(word, False))
        _ -> #(False, #(word, expecting))
      }
    })

  list.intersperse(spans, #(" ", False))
}
