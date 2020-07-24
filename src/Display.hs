module Display (view) where

import Data

import Graphics.Gloss

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
viewRow yOffset = pictures . zipWith drawSpace [-100, -50 ..]
  where drawSpace xOffset = translate xOffset yOffset . viewSpace


viewBoard :: [[Space]] -> Picture
viewBoard = pictures . zipWith viewRow [-100, -50 ..]


view :: Game -> Picture
view game =
  pictures
    [ viewBoard $ spaces game
    , scale 0.25 0.25 $ translate (-300) (-200) $ text $ show $ selected game
    ]
