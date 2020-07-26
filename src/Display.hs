module Display (view) where

import Data

import Graphics.Gloss

teamToColor :: Team -> Color
teamToColor Red = red
teamToColor Blue = blue


viewPiece :: Piece -> Picture
viewPiece Sensei = circleSolid 20
viewPiece Student = thickCircle 1 20


viewSpace :: Space -> Picture
viewSpace Empty = rectangleWire 50 50
viewSpace (Ocupied (team, piece)) = pictures [viewSpace Empty, color (teamToColor team) (viewPiece piece)]


coordXToPixel :: Int -> Float
coordXToPixel x = fromIntegral (x-2) * 50


coordYToPixel :: Int -> Float
coordYToPixel y = -1 * fromIntegral (y-2) * 50


viewSelection :: Selection -> Picture
viewSelection Nothing = Blank
viewSelection (Just (_, (x, y))) = color (greyN 0.25) $ translate (coordXToPixel x) (coordYToPixel y) $ rectangleSolid 50 50


viewRow :: Float -> [Space] -> Picture
viewRow yOffset = pictures . zipWith drawSpace [100, 50 ..]
  where drawSpace xOffset = translate xOffset yOffset . viewSpace


viewBoard :: [[Space]] -> Picture
viewBoard = pictures . zipWith viewRow [100, 50 ..]


viewObj :: (Float, Float) -> String -> Picture
viewObj (x, y) o = scale 0.25 0.25 $ translate x y $ text o


view :: Game -> Picture
view game =
  let s = "selected: " ++ maybe "" (show . fst) (selected game)
  in pictures
    [ viewSelection $ selected game
    , viewBoard $ spaces game
    , viewObj (-500, 550) s
    , viewObj (-500, -620) $ show $ turn game
    ]
