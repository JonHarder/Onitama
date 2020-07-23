module Onitama
    ( runGame
    , defaultGame
    ) where


import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Interact


data Piece = Sensei | Student
data Team = Red | Blue

data Space
  = Empty
  | Ocupied (Team, Piece)


newtype Game = Game { spaces :: [[Space]] }


blueStudent :: Space
blueStudent = Ocupied (Blue, Student)

redStudent :: Space
redStudent = Ocupied (Red, Student)

blueSensei :: Space
blueSensei = Ocupied (Blue, Sensei)

redSensei :: Space
redSensei = Ocupied (Red, Sensei)


teamToColor :: Team -> Color
teamToColor Red = red
teamToColor Blue = blue


viewPiece :: Piece -> Picture
viewPiece Sensei = circleSolid 20
viewPiece Student = thickCircle 2 20


viewSpace :: Space -> Picture
viewSpace Empty = rectangleWire 50 50
viewSpace (Ocupied (team, piece)) = pictures [viewSpace Empty, color (teamToColor team) (viewPiece piece)]


viewRow :: Float -> [Space] -> Picture
viewRow yOffset = pictures . zipWith drawSpace [-200, -150 ..]
  where drawSpace xOffset = translate xOffset yOffset . viewSpace


viewBoard :: [[Space]] -> Picture
viewBoard = pictures . zipWith viewRow [-200, -150 ..]


defaultGame :: Game
defaultGame = Game [ [redStudent, redStudent, redSensei, redStudent, redStudent]
                   , [Empty,      Empty,      Empty,     Empty,      Empty]
                   , [Empty,      Empty,      Empty,     Empty,      Empty]
                   , [Empty,      Empty,      Empty,     Empty,      Empty]
                   , [blueStudent, blueStudent, blueSensei, blueStudent, blueStudent]
                   ]


view :: Game -> Picture
view = viewBoard . spaces


update :: Float -> Game -> Game
update _ game = game


handleInput :: Event -> Game -> Game
handleInput _ game = game


runGame :: Game -> IO ()
runGame game = play (InWindow "Onitama" (640, 480) (10, 10)) white 60 game view handleInput update
