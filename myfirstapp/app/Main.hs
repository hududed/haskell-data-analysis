module Main where
import Text.CSV ( parseCSVFromFile )

baseball <- parseCSVFromFile "data/GL2015.TXT"
noEmptyRows = either (const []) (filter (\row -> 2 <= length row)) -- last element in CSV is an empty list (row) 
baseBallList = noEmptyRows baseball

readIndex :: Read cell => Either a CSV -> Int -> [Cell]
readIndex csv index = map (read .(!! index)) (noEmptyRows csv)

main :: IO ()
main = readIndex baseball 9::[Integer]