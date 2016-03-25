data Node
  = P String
  | E String [(String, String)] [Node]

instance Show Node where
  show (P string) = string
  show (E tag attributes nodes) =
    let
      showAttribute (key, val) = " " ++ key ++ "='" ++ val ++ "'"
    in
         "<" ++ tag ++ (foldl (++) "" (map showAttribute attributes)) ++ ">"
      ++ (foldl (++) "" (map show nodes))
      ++ "</" ++ tag ++ ">"


-- Containers
html = E "html" []
head_ = E "head" []
body = E "body" []
p = E "p" []

-- Sugar
text = P
blank = P ""

-- Simple elements
h1 = E "h1" []
h2 = E "h2" []

-- Sugary simple elements
title t = E "title" [] [ text t ]
link href t = E "a" [ ("href", href) ] [ text t ]


document authenticated =
  html

    [ head_
        [ title "Nic's webpage" ]

    , body
        [ h1 [ text "Hello!" ]
        , p [ text "What's up?" ]
        , if authenticated then p [ text "Private stuff" ] else blank
        , p [ text "This is ", link "http://example.org" "a link", text "." ]
        , h2 [ link "#" "An anchor link" ]
        ]

    ]

main = putStrLn $ show (document False)
