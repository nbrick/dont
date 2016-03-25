data Node = P String
          | E String [Node]

instance Show Node where
    show (P string) = string
    show (E tag nodes) =    "<" ++ tag ++ ">"
                         ++ (foldl (++) "" (map show nodes))
                         ++ "</" ++ tag ++ ">"


-- Containers
html = E "html"
head_ = E "head"
body = E "body"

-- Simple elements
title text = E "title" [ P text ]
h1 text = E "h1" [ P text ]
p text = E "p" [ P text ]

nothing = P ""


document authenticated =
  html

  [ head_
    [ title "Nic's webpage" ]

  , body
    [ h1 "Hello!"
    , p "What's up?"
    , if authenticated then p "Private stuff" else nothing
    ]

  ]

main = putStrLn $ show (document False)
