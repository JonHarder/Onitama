{-# LANGUAGE OverloadedStrings #-}
module Data.Card where

import Data.Text

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

data Card = Card { cardName :: Text, cardTeam :: Team, cardOptions :: [Option] }

rooster :: Card
rooster =
  Card { cardTeam = Red
       , cardName = "Rooster"
       , cardOptions =
         [ Move (-1,  0)
         , Move (-1,  1)
         , Move ( 1,  0)
         , Move ( 1, -1)
         ]
       }

goose :: Card
goose =
  Card { cardTeam = Blue
       , cardName = "Goose"
       , cardOptions =
         [ Move (-1, 0)
         , Move (-1, -1)
         , Move (1, 0)
         , Move (1, 1)
         ]
       }

dragon :: Card
dragon =
  Card { cardTeam = Red
       , cardName = "Dragon"
       , cardOptions =
         [ Move (-1, 1)
         , Move (-2, -1)
         , Move (2, -1)
         , Move (1, 1)
         ]
       }


tiger :: Card
tiger =
  Card { cardTeam = Blue
       , cardName = "Tiger"
       , cardOptions =
         [ Move (0, 1)
         , Move (0, -2)
         ]
       }


crab :: Card
crab =
  Card { cardTeam = Blue
       , cardName = "Crab"
       , cardOptions =
         [ Move (-2, 0)
         , Move (2, 0)
         , Move (0, -1)
         ]
       }

monkey :: Card
monkey =
  Card { cardTeam = Blue
       , cardName = "Monkey"
       , cardOptions =
         [ Move (-1, -1)
         , Move (-1, 1)
         , Move (1, -1)
         , Move (1, 1)
         ]
       }


crane :: Card
crane =
  Card { cardTeam = Blue
       , cardName = "Crane"
       , cardOptions =
         [ Move (-1, 1)
         , Move (1, 1)
         , Move (0, -1)
         ]
       }

elephant :: Card
elephant =
  Card { cardTeam = Red
       , cardName = "Elephant"
       , cardOptions =
         [ Move (-1, 0)
         , Move (-1, -1)
         , Move (1, 0)
         , Move (1, -1)
         ]
       }


mantis :: Card
mantis =
  Card { cardTeam = Red
       , cardName = "Mantis"
       , cardOptions =
         [ Move (-1, -1)
         , Move (1, -1)
         , Move (0, 1)
         ]
       }


boar :: Card
boar =
  Card { cardTeam = Red
       , cardName = "Boar"
       , cardOptions =
         [ Move (-1, 0)
         , Move (0, -1)
         , Move (1, 0)
         ]
       }

frog :: Card
frog =
  Card { cardTeam = Red
       , cardName = "Frog"
       , cardOptions =
         [ Move (-2, 0)
         , Move (-1, -1)
         , Move (1, 1)
         ]
       }

horse :: Card
horse =
  Card { cardTeam = Red
       , cardName = "Horse"
       , cardOptions =
         [ Move (-1, 0)
         , Move (0, 1)
         , Move (0, -1)
         ]
       }


eel :: Card
eel =
  Card { cardTeam = Blue
       , cardName = "Eel"
       , cardOptions =
         [ Move (-1, -1)
         , Move (-1, 1)
         , Move (1, 0)
         ]}


rabbit :: Card
rabbit =
  Card { cardTeam = Blue
       , cardName = "Rabbit"
       , cardOptions =
         [ Move (-1, 1)
         , Move (1, -1)
         , Move (2, 0)
         ]
       }


ox :: Card
ox =
  Card { cardTeam = Blue
       , cardName = "Ox"
       , cardOptions =
         [ Move (0, -1)
         , Move (1, 0)
         , Move (0, 1)
         ]
       }


cobra :: Card
cobra =
  Card { cardTeam = Red
       , cardName = "Cobra"
       , cardOptions =
         [ Move (-1, 0)
         , Move (1, -1)
         , Move (1, 1)
         ]
       }
