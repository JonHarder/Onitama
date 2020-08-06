module Display (view) where

import Data.Maybe (fromMaybe)
import Data.Text (unpack)

import Board
import Data
import Data.Card

import Graphics.Gloss

class Drawable a where
  draw :: a -> Picture


instance Drawable Piece where
  draw piece =
    case piece of
      Sensei -> circleSolid 20
      Student -> thickCircle 1 20


teamToColor :: Team -> Color
teamToColor Red = red
teamToColor Blue = blue


instance Drawable Space where
  draw Empty = rectangleWire 50 50
  draw (Ocupied (spaceTeam, piece)) = pictures [draw Empty, color (teamToColor spaceTeam) (draw piece)]
  draw Option = pictures [draw Empty, color (greyN 0.75) $ rectangleSolid 49 49]


coordXToPixel :: Int -> Float
coordXToPixel x = fromIntegral (x-2) * 50


coordYToPixel :: Int -> Float
coordYToPixel y = -1 * fromIntegral (y-2) * 50


instance Drawable Selection where
  draw (Selection s) = maybe Blank f s
    where f (OcupiedSpace _ (x, y)) =
            let coordX = coordXToPixel x
                coordY = coordYToPixel y
                c = greyN 0.60
            in color c $ translate coordX coordY $ rectangleSolid 50 50


applyMove :: (Int, Int) -> Option -> (Int, Int)
applyMove (x, y) (Move (x', y')) = (x+x', y+y')


instance Drawable Card where
  draw card =
    let start = (2, 2)
        options = map (applyMove start) (cardOptions card)
        board = [ [Empty, Empty, Empty, Empty, Empty]
                , [Empty, Empty, Empty, Empty, Empty]
                , [Empty, Empty, Empty, Empty, Empty]
                , [Empty, Empty, Empty, Empty, Empty]
                , [Empty, Empty, Empty, Empty, Empty]
                ]
        setOption move b = fromMaybe board $ setSpace move Option b
        board' = foldr setOption board options
      in pictures
      [ viewBoard board'
      , draw $ Selection $ Just $ OcupiedSpace Empty start
      , translate 0 25 $ rectangleWire 300 350
      , viewObj (-500, 600) $ unpack $ cardName card
      , translate 99 160 $ color (teamToColor (cardTeam card)) $ rectangleSolid 50 50
      ]


viewRow :: Float -> [Space] -> Picture
viewRow yOffset = pictures . zipWith drawSpace [100, 50 ..]
  where drawSpace xOffset = translate xOffset yOffset . draw

viewBoard :: [[Space]] -> Picture
viewBoard = pictures . zipWith viewRow [100, 50 ..]


viewObj :: (Float, Float) -> String -> Picture
viewObj (x, y) o = scale 0.25 0.25 $ translate x y $ text o


instance Drawable Game where
  draw game = 
    let (Selection sel) = selected game
        s = "selected: " ++ maybe "" (show . ocupiedSpace) sel
    in pictures
      [ draw $ selected game
      , viewBoard $ spaces game
      , viewObj (-500, 550) s
      , viewObj (-500, -620) $ "Turn: " ++ show (turn game)
      , translate (-500) (-800) $ draw rooster
      ]


view :: Game -> Picture
view = draw
