module Onitama
    ( runGame
    , defaultGame
    ) where


import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact


data Game = Game

defaultGame :: Game
defaultGame = Game

view :: Game -> Picture
view _ = circle 32.0

update :: Float -> Game -> Game
update delta game = game

handleInput :: Event -> Game -> Game
handleInput event game = game

runGame :: Game -> IO ()
runGame game = play (InWindow "Onitama" (640, 480) (10, 10)) white 60 game view handleInput update
