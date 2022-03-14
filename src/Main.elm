module Main exposing (main)

import Browser
import Html exposing (Html, div, text)

main =
    Browser.sandbox { init = (), update = update, view = view }


update msg model =
    ()


view model =
    div []
        []
