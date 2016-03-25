data Node = P String
          | E String [Node]

instance Show Node where
    show (P string) = string
    show (E tag nodes) =    "<" ++ tag ++ ">"
                         ++ (foldl (++) "" (map show nodes))
                         ++ "</" ++ tag ++ ">"

html = E "html"
head_ = E "head"
title = E "title"
body = E "body"
h1 = E "h1"
p = E "p"

document =
  html

  [ head_
    [ title [ P "Nic's webpage" ] ]

  , body
    [ h1 [ P "Hello!" ]
    , p [ P "What's up?" ]
    ]

  ]

main = putStrLn $ show document
