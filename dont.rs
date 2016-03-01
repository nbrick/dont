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
    let head = Element::Dob {
        tag: String::from("head"),
        contents: vec![Element::Plain(String::from("wassup"))],
    };

    let html = Element::Dob {
        tag: String::from("html"),
        contents: vec![head, Element::Plain(String::from("hello!"))],
    };

    println!("{}", html);
}
