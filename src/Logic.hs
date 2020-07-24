module Logic (update, handleInput) where

import Graphics.Gloss.Interface.IO.Interact

import Data

update :: Float -> Game -> Game
update = flip const


convertX :: Float -> Int
convertX x = round $ ((screenWidth / 2 + (x - 10)) / 50) - 3

convertY :: Float -> Int
convertY y = round $ ((screenHeight / 2 - (y + 12)) / 50) - 3


convertCoords :: (Float, Float) -> (Int, Int)
convertCoords (xF, yF) = (convertX xF, convertY yF)


safeIndex :: Int -> [a] -> Maybe a
safeIndex i ls = if i+1 > length ls || i < 0
  then Nothing
  else Just $ ls !! i


selectSpace :: (Int, Int) -> [[Space]] -> Maybe Space
selectSpace (x, y) board = safeIndex y board >>= safeIndex x


handleInput :: Event -> Game -> Game
handleInput (EventKey key Up _ loc) game =
  case key of
    MouseButton LeftButton ->
      game { selected = selectSpace (convertCoords loc) (spaces game) }
    _ ->
      game
handleInput _ game = game
