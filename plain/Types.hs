module Types where

import Data.Array

data Cell = Cell Int Int deriving (Eq, Ord, Ix, Show)
type Piece = Array Cell Bool
type Grid = Piece
