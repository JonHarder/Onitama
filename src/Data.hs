module Data where

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
