module MyCSV where

import Text.CSV

noEmptyRows :: Either a CSV -> CSV
noEmptyRows = either (const []) (filter (\row -> 2 <= length row))

{- Reads a column of data from a CSV file -}
readIndex :: Read cell => Either a CSV -> Int -> [cell]
readIndex ecsv index = map read (getIndex ecsv index)
-- e.g. awayRuns = readIndex testCSV ColNum :: [Integer]

{- Reads a column of data from a CSV file -}
getIndex :: Either a CSV -> Int -> [String]
getIndex ecsv index = map (!! index) (noEmptyRows ecsv)
-- e.g. gameDates = getIndex testCSV ColNum