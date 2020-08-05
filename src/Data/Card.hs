module Data.Card where

import Data

-- A move is represents a translation of a piece
-- from it's current place on the board, to a new
-- place on the board. The first coordinate in the tuple
-- represents the pieces X axis translation, 0 being no
-- movement on the X axis, negative numbers representing
-- the number of spaces to the left along the X axis
-- the piece should travel, and positive numbers representing
-- the number of spaces to the right.
-- The same is true for the second number in the tuple but
-- for the Y axis. 0 being no vertical movement, negative
-- representing upwards movement, positive being downwards
newtype Option = Move (Int, Int)

-- |         -1
-- | 
-- | x  -1  (0,0)   1
-- | 
-- |          1
-- +------------------
--           y

data Card = Card { team :: Team, options :: [Option] }

rooster :: Card
rooster =
  Card { team = Red
       , options =
         [ Move (-1,  0)
         , Move (-1, -1)
         , Move ( 1,  0)
         , Move ( 1,  1)
         ]
       }

goose :: Card
goose =
  Card { team = Blue
       , options =
         [ Move (-1, 0)
         , Move (-1, 1)
         , Move (1, 0)
         , Move (1, -1)
         ]
       }
