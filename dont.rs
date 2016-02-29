use std::string::String;
use std::collections::LinkedList;
use std::fmt;

enum Element {
    Plain(String),
    Dob { tag: String, contents: LinkedList<Element> },
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
            }
        }
    }
}

fn main() {
    let mut html = Element::Dob {
        tag: String::from("html"),
        contents: LinkedList::new(),
    };
    
    let mut head = Element::Dob {
        tag: String::from("head"),
        contents: LinkedList::new(),
    };
    
    match head {
        Element::Dob {tag: ref t, contents: ref mut c} => {
            c.push_back(Element::Plain(String::from("wassup")))
        }
        Element::Plain(_) => {}
    }
    
    match html {
        Element::Dob {tag: ref t, contents: ref mut c} => {
            c.push_back(head);
            c.push_back(Element::Plain(String::from("hello!")))
        }
        Element::Plain(_) => {}
    }

    println!("{}", html);
}
