module Main exposing (main)

import Html exposing (..)

import Html.Attributes exposing (..)

main =
    div []
    [h1 [style "color" "red"] [text "Hello World"]
    , p [] [text "by Elm"]
    , viewList ["a", "b", "c"]
    ]

viewList: List String-> Html msg
viewList strings =
    ul [] (List.map viewItem strings)

viewItem: String -> Html msg
viewItem string =
    li [] [text string]


