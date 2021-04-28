module Main exposing (main)

import Css exposing (..)
import Html.Grid as Grid
import Flex
import Browser 
import Random
import Html.Styled as Html exposing ( Attribute, Html, node, p, text, button, div, img)
import Html.Styled.Attributes exposing (class, src)
import Html.Styled.Events exposing (onClick)
--import TLWND as TW
--import TLWND.LG as TW_lg

-- Main
-- main = Browser.sandbox { init = init, update = update, view = view }
type Orb
    = Blue
    | Red
    | Green
    | Light
    | Dark
    | Heart

--makeRow : () -> List (Grid.Column msg)
--makeRow _ = 
--    List.map (\_ -> Grid.column [ Grid.exactWidthColumn (px 100) ] [ randOrb ]) (List.repeat 6 ())

main = 
    Browser.element
    {
        init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
    }


--main =
--    let
--        orb =
--            Grid.column [ Grid.exactWidthColumn (px 100) ] [ orbimage Blue ]  
--    in 
--        Grid.box []
--        (
--            List.map (\_ -> Grid.row [ height (px 30) ] ( makeRow () )) (List.repeat 5 ()) 
--            )
--            |>Html.toUnstyled


-- Model

type alias Model = List (List Orb)

randOrb : Random.Generator Orb
randOrb =
    Random.uniform Blue [ Red, Green, Light, Dark, Heart ]

randBoard : Random.Generator (List (List Orb))
randBoard =
    Random.list 5 (Random.list 6 (randOrb))

init : () -> ( Model, Cmd Msg )
init _ =
    ( (List.repeat 5 (List.repeat 6 Blue)), (Random.generate Regenerate (randBoard)) )

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- Update

type Msg 
    = Regenerate Model

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Regenerate m ->
            ( m, Cmd.none )

-- View
orbimage : Orb -> Html msg
orbimage x =
    case x of
        Blue -> img [ src "images/Blue.png" ] []
        Red -> img [ src "images/Red.png" ] []
        Green -> img [ src "images/Green.png" ] []
        Light -> img [ src "images/Light.png" ] []
        Dark -> img [ src "images/Dark.png" ] []
        Heart -> img [ src "images/Heart.png" ] []

--view : Model -> Node Msg
view board =
    Grid.box [] ( List.map ( \row ->
        Grid.row [ height (px 100) ] (List.map ( \o ->
            Grid.column [ Grid.exactWidthColumn (px 100) ] 
                [ orbimage o ] 
        ) row) 
    ) board) 
    |> Html.toUnstyled

--view : Model -> Html Msg
--view model =
--  let
--    blue =
--      img [ src "images/Blue.png" ] []
--
--    red = 
--      img [ src "images/Red.png" ] []
--
--    green =
--      img [ src "images/Green.png" ] []
--
--    light = 
--      img [ src "images/Light.png" ] []
--
--    dark =
--      img [ src "images/Dark.png" ] []
--
--    heart =
--      img [ src "images/Heart.png" ] []
--
--  in
--  Grid.box [] 
--    [
--      --div ([] ++ Flex.fxLayout Flex.row Flex.spaceAround Flex.center )
--      --  [ 
--      --    button [ onClick Decrement ] [ text "-" ]
--      --    , div [] [ text (String.fromInt model) ]
--      --    , button [onClick Increment ] [ text "+" ]
--      --  ]
--      Grid.row [ height (px 30) ]
--        [
--          Grid.column [ Grid.exactWidthColumn (px 30) ] [ HTML.div [] [blue]]
--        ]
--    ]
