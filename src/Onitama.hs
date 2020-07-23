module Onitama
    ( runGame
    , defaultGame
    ) where


import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact


data Piece = Sensei | Student

data Space
  = Empty
  | Red Piece
  | Blue Piece


data Game = Game { board :: [[Space]] }


viewSpace :: Space -> Picture
viewSpace Empty = rectangleWire 50 50
viewSpace (Red Sensei) = pictures [viewSpace Empty, color red (circleSolid 20)]
viewSpace (Red Student) = pictures [viewSpace Empty, color red (thickCircle 2 20)]
viewSpace (Blue Sensei) = pictures [viewSpace Empty, color blue (circleSolid 20)]
viewSpace (Blue Student) = pictures [viewSpace Empty, color blue (thickCircle 2 20)]


viewBoard :: Game -> Picture
viewBoard game = pictures
    [ translate (-200) 200 $ viewSpace Empty
    , translate (-150) 200 $ viewSpace (Red Student)
    , translate (-100) 200 $ viewSpace (Red Sensei)
    , translate (-50)  200 $ viewSpace Empty
    , translate 0      200 $ viewSpace (Blue Sensei)
    , translate 50     200 $ viewSpace (Blue Student)
    ]


defaultGame :: Game
defaultGame = Game (replicate 5 (replicate 5 Empty))


view :: Game -> Picture
view = viewBoard


update :: Float -> Game -> Game
update delta game = game


handleInput :: Event -> Game -> Game
handleInput event game = game


runGame :: Game -> IO ()
runGame game = play (InWindow "Onitama" (640, 480) (10, 10)) white 60 game view handleInput update
