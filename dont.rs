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
            Element::Plain(ref s) => write!(f, "{}", s),
            Element::Dob {tag: ref t, contents: ref c} => {
                write!(f, "<{}>", t);
                for elem in c {
                    write!(f, "{}", elem);
                }
                write!(f, "</{}>", t)
            },
        }
    }
}

fn main() {
    let mut head = Element::Dob {
        tag: String::from("head"),
        contents: vec![Element::Plain(String::from("wassup"))],
    };

    let mut html = Element::Dob {
        tag: String::from("html"),
        contents: vec![head, Element::Plain(String::from("hello!"))],
    };

    println!("{}", html);
}
