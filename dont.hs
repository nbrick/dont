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

-- Simple elements
h1 = E "h1" []
title text = E "title" [] $ just text
link href text = E "a" [ ("href", href) ] $ just text

-- Sugar
just text = [ P text ]
text = P
blank = P ""


document authenticated =
  html

    [ head_
        [ title "Nic's webpage" ]

    , body
        [ h1 $ just "Hello!"
        , p $ just "What's up?"
        , if authenticated then p $ just "Private stuff" else blank
        , p [ text "This is ", link "http://example.org" "a link", text "." ]
        ]

    ]

main = putStrLn $ show (document False)
