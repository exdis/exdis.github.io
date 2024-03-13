module Input exposing (input)

import Html exposing (Html, div, span, br, text, textarea)
import Html.Attributes exposing (class, property)

underConstruction : String
underConstruction = """
░█░█░█▀█░█▀▄░█▀▀░█▀▄░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▄░█░█░█▀▀░▀█▀░▀█▀░█▀█░█▀█
░█░█░█░█░█░█░█▀▀░█▀▄░░░█░░░█░█░█░█░▀▀█░░█░░█▀▄░█░█░█░░░░█░░░█░░█░█░█░█
░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀
"""

underConstructionBanner : List (Html ())
underConstructionBanner =
  underConstruction
    |> String.split "\n"
    |> List.map (\item -> div [] [text item, br [] []])

noBreakSpace : String
noBreakSpace = "\u{00A0}~\u{00A0}"

input : () -> Html ()
input model =
  div [] [
    div [] underConstructionBanner,
    div [ class "prompt" ]
      [ span [ class "bg" ] [ text noBreakSpace ]
      , text  "" ]
    ]

