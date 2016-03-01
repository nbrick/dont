use std::string::String;
use std::vec::Vec;
use std::fmt;

enum Element {
    Plain(String),
    Dob { tag: String, contents: Vec<Element> },
}

impl fmt::Display for Element {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            Element::Plain(ref string) => write!(f, "{}", string),
            Element::Dob { ref tag, ref contents } => {
                try!(write!(f, "<{}>", tag));
                for element in contents {
                    try!(write!(f, "{}", element));
                }
                write!(f, "</{}>", tag)
            },
        }
    }
}

fn main() {
    let html = Element::Dob {
        tag: String::from("html"),
        contents: vec![
            Element::Dob {
                tag: String::from("head"),
                contents: vec![
                    Element::Dob {
                        tag: String::from("title"),
                        contents: vec![
                            Element::Plain(String::from("hello")),
                        ],
                    },
                ],
            },
            Element::Dob {
                tag: String::from("body"),
                contents: vec![
                    Element::Dob {
                        tag: String::from("h1"),
                        contents: vec![
                            Element::Plain(String::from("my heading")),
                        ],
                    },
                    Element::Plain(String::from("some body text")),
                ],
            },
        ],
    };

    println!("{}", html);
}
