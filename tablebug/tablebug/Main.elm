module BugApp where

import Table exposing (..)
import StartApp.Simple exposing (start)


main =
  start
    { model = init
    , update = update
    , view = view
    }
