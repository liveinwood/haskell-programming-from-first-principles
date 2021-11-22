module Main where

import Chap16

f :: Int -> String
f = show

g :: String -> Bool
g s = length s > 5

main :: IO ()
main = do
  print $ fmap id (Pair 1 2) == id (Pair 1 2)

  let l = (g . f) <$> Pair 1 10000
      r = (fmap g) . fmap (f) $ Pair 1 10000
  print (l == r)

  print $ fmap id (Two "one" 2) == id (Two "one" 2)
  let l' = fmap (g . f) (Two "one" 2)
      r' = (fmap g) . (fmap f) $ (Two "one" 2)
  print (l' == r')