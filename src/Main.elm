module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Input exposing(input)

main =
    Browser.sandbox { init = (), update = update, view = view }


update msg model =
    ()


view model =
    div []
        [ input model ]
