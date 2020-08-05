import Test.Hspec
import Test.QuickCheck

import Logic

main :: IO ()
main = hspec $
  describe "safeIndex" $
    it "returns nothing when empty" $
      property $ \x -> safeIndex x [] == (Nothing :: Maybe Int)
