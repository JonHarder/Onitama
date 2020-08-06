module Board where


safeIndex :: Int -> [a] -> Maybe a
safeIndex i ls = if i+1 > length ls || i < 0
  then Nothing
  else Just $ ls !! i


setSpace :: (Int, Int) -> a -> [[a]] -> Maybe [[a]]
setSpace (x, y) val grid = do
  row <- safeIndex y grid
  let row' = take x row ++ [val] ++ drop (x + 1) row
  return $ take y grid ++ [row'] ++ drop (y + 1) grid
