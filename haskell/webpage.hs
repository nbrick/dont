import Dont hiding (head)
import qualified Dont as D (head)

document authenticated =
  html

    [ D.head
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
