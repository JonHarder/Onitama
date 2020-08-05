module Onitama
    ( runGame
    , defaultGame
    ) where


import Graphics.Gloss (play, white, Display(..))

import Data
import Display (view)
import Logic


defaultGame :: Game
defaultGame = Game { spaces =
                     [ [redStudent,  redStudent,  redSensei,  redStudent,  redStudent]
                     , [Empty,       Empty,       Empty,      Empty,       Empty]
                     , [Empty,       Empty,       Empty,      Empty,       Empty]
                     , [Empty,       Empty,       Empty,      Empty,       Empty]
                     , [blueStudent, blueStudent, blueSensei, blueStudent, blueStudent]
                     ]
                   , selected = Selection Nothing
                   , turn = Blue
                   }


runGame :: Game -> IO ()
runGame initState =
  let window = InWindow "Onitama" (screenWidth, screenHeight) (10, 10)
      fps = 60
      background = white
  in play window background fps initState view handleInput update
