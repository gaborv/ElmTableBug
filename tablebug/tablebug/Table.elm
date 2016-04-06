module Table where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List exposing (..)

-- MODEL
type alias Model = 
    { temperatures: List (String, Int)
     , action: Action
    }
    
noHtml = text ""

init: Model
init =
        ( Model  
            []
            Year2014)

-- UPDATE

type Action = Year2014 | Year2015

update : Action -> Model -> Model
update action model =
    let
        y2014 = 
        [ ("january", -5)
        , ("february", 0)
        , ("march", 10)
        , ("april", 19)
        , ("may", 20)
        , ("june", 29)
        , ("july", 31)
        , ("august", 30)
        , ("september", 15)
        , ("october", 3)
        , ("november", 2)
        , ("december", -10)
        ]
        
        y2015 = 
        [ ("january", -10)
        , ("february", 0)
        , ("march", 10)
        , ("april", 19)
        , ("may", 20)
        , ("june", 29)
        , ("july", 40)
        , ("august", 35)
        , ("september", 15)
        , ("october", 3)
        , ("november", 1)
        , ("december", -15)
        ]
    in
    case action of
        Year2014 ->
        ({model | temperatures = y2014, action = action})
        
        Year2015 ->
        ({model | temperatures = y2015, action = action})


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  
  div []
    [ div 
        []
        [ button [ onClick address Year2014 ] [ text "2014" ]
        , button [ onClick address Year2015 ] [ text "2015" ]
        ]   
        
    , if model.action == Year2014 then
         table []
            [ 
                thead []
                [ tr [ rowspan 2]
                    [ th [ colspan 2]
                        [ text "statistics" ]
                    ]                
                , tr []
                    [ th []
                        [ text "month" ]
                    , th []
                        [ text "temperature" ]
                    ]
                ]
            , tbody []
                (List.map renderTemperature model.temperatures) 
            ]
    else
        table []
            [ 
                thead []
                [ tr []
                    [ th []
                        [ text "month" ]
                    , th []
                        [ text "temperature" ]
                    ]              
                , tr [ rowspan 2]
                    [ th [ colspan 2]
                        [ text "statistics" ]
                    ]  
                ]
            , tbody []
                (List.map renderTemperatureFlip model.temperatures) 
            ]
    ]
    
renderTemperature : (String, Int) -> Html
renderTemperature (month, temperature) =
    tr []
        [ td []
            [ text month ]
        , td []
            [ text (temperature |> toString) ]
        ]
        
renderTemperatureFlip : (String, Int) -> Html
renderTemperatureFlip (month, temperature) =
    tr []
        [ td []
            [ text (temperature |> toString) ]
        , td []
            [ text month ]
        ]

