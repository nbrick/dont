data Node = P String
          | E String [Node]

instance Show Node where
    show (P string) = string
    show (E tag nodes) =    "<" ++ tag ++ ">"
                         ++ (foldl (++) "" (map show nodes))
                         ++ "</" ++ tag ++ ">"

html = E "html"
                [ E "head"
                           [ E "title" [ P "Nic's webpage" ] ]

                , E "body"
                           [ E "h1" [ P "Hello!" ]
                           , P "What's up?"
                           ]
                ]

main = putStrLn $ show html
