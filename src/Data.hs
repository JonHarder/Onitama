module Data where

data Piece = Sensei | Student
  deriving (Show, Eq)
data Team = Red | Blue
  deriving (Show, Eq)

data Space
  = Empty
  | Ocupied (Team, Piece)
  | Option
  deriving Eq


instance Show Space where
  show Empty = "empty"
  show (Ocupied x) = show x
  show Option = "option"

data OcupiedSpace = OcupiedSpace { ocupiedSpace :: Space, ocupiedCoord :: (Int, Int) }

newtype Selection = Selection { selection :: Maybe OcupiedSpace }

type Board = [[Space]]

data Game = Game { turn :: Team, spaces :: [[Space]], selected :: Selection }

blueStudent :: Space
blueStudent = Ocupied (Blue, Student)

redStudent :: Space
redStudent = Ocupied (Red, Student)

blueSensei :: Space
blueSensei = Ocupied (Blue, Sensei)

redSensei :: Space
redSensei = Ocupied (Red, Sensei)

screenWidth :: Num a => a
screenWidth = 520

screenHeight :: Num a => a
screenHeight = 520
