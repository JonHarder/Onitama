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


-- takes an x, y tuple representing the tile the user has selected
-- and the 2d grid of spaces which may be empty or may contain a piece.
-- The coordinates given should have been converted from the floating
-- pixel representation of where the user clicked, and so may be negative,
-- or out of bounds of the grid of spaces. Thus, this will return Nothing
-- when a space outside the bounds of the board has been clicked.
selectSpace :: (Int, Int) -> [[Space]] -> Selection
selectSpace coord@(x, y) board = safeIndex y board >>= safeIndex x >>= \space -> return (space, coord)


handleInput :: Event -> Game -> Game
handleInput (EventKey key Up _ loc) game =
  case key of
    MouseButton LeftButton ->
      game { selected = selectSpace (convertCoords loc) (spaces game) }
    _ ->
      game
handleInput _ game = game
