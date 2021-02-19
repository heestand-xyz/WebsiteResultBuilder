    import XCTest
    @testable import WebResultBuilder

    final class WebResultBuilderTests: XCTestCase {
        func testExample() {
            
            #if os(macOS)
            let desktopURL: URL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")
            #else
            #warning("Run Test on macOS")
            let desktopURL: URL = URL(string: "")!
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
            
            
        }
    }
