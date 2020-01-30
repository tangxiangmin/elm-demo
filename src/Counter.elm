module Counter exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
    {
        count : Int
    }

init : Model
init =
    {
      count = 0
    }

-- UPDATE

type Msg = Increment | Decrement | Reset
    | Input String

update : Msg -> Model -> Model
update msg model =
  case msg of
    -- 增加
    Increment ->
      {model | count = model.count + 1}
    -- 减少
    Decrement ->
      {model | count = model.count - 1}
    -- 重置
    Reset ->
      {model | count = 0}
    -- 直接调整
    Input num ->
       {model | count = Maybe.withDefault 0 <| String.toInt num}

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , span [] [ text (String.fromInt model.count) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset ] [ text "reset" ]
    , viewInput model
    ]

viewInput: Model -> Html Msg
viewInput model =
 input [ placeholder "counter text", value (String.fromInt model.count), onInput Input ] []
