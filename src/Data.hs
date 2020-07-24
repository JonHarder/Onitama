module Data where

data Piece = Sensei | Student
  deriving Show
data Team = Red | Blue
  deriving Show

data Space
  = Empty
  | Ocupied (Team, Piece)


instance Show Space where
  show Empty = "empty"
  show (Ocupied x) = show x


data Game = Game { spaces :: [[Space]], selected :: Maybe Space }


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