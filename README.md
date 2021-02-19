# Website Result Builder

```swift
#if os(macOS)
let desktopURL: URL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
#endif

let htmlURL: URL = desktopURL.appendingPathComponent("index.html")
let html: HTML =
    HTML {
        Head {
            Title("Test")
            Link(rel: "stylesheet", href: "style.css")
        }
        Body {
            Div(class: "test") {
                "test"
                "1 2 3"
            }
            A(id: "site", href: "http://heestand.xyz/") {
                "Heestand XYZ"
            }
        }
    }
try! html.render().write(to: htmlURL, atomically: false, encoding: .utf8)

let cssURL: URL = desktopURL.appendingPathComponent("style.css")
let css: CSS =
    CSS {
        Class(name: "test") {
            Property.position(.absolute)
            Property.backgroundColor(.black)
            Property.color(.white)
        }
        ID(name: "site") {
            Property.backgroundColor(.gray)
        }
    }
try! css.render().write(to: cssURL, atomically: false, encoding: .utf8)

```
