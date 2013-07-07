module ReadPiece where

import Data.Array
import Data.Char
import Data.List.Split

import Types

adjustLength :: Int -> [Bool] -> [Bool]
adjustLength n xs = take n (xs ++ repeat False)

trimFalse :: [Bool] -> [Bool]
trimFalse = reverse . dropWhile (== False) . reverse

readPieces :: String -> [Piece]
readPieces = map readPiece . splitWhen isDelimLine . lines
  where isDelimLine = (== ".") . filter (not . isSpace)
        readPiece ls = listArray (Cell 0 0, Cell (height-1) (width-1)) bits
          where height = length ls
                width = maximum $ map (length . trimFalse) bitRows
                bits = concatMap (adjustLength width) bitRows
                bitRows = map (map (== '#')) ls
