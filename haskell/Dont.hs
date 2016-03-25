module Dont where

data Node
  = T String
  | E String [(String, String)] [Node]

instance Show Node where
  show (T string) = string
  show (E tag attributes nodes) =
    let
      showAttribute (key, val) = " " ++ key ++ "='" ++ val ++ "'"
    in
         "<" ++ tag ++ (foldl (++) "" (map showAttribute attributes)) ++ ">"
      ++ (foldl (++) "" (map show nodes))
      ++ "</" ++ tag ++ ">"


-- Containers
html = E "html" []
head = E "head" []
body = E "body" []
p = E "p" []

-- Sugar
text = T
blank = T ""

-- Simple elements
h1 = E "h1" []
h2 = E "h2" []

-- Sugary simple elements
title t = E "title" [] [ text t ]
link href t = E "a" [("href", href)] [ text t ]
