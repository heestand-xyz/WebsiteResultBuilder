import Foundation

protocol Element {
    
    var prefix: String { get }
    
    var name: String { get }
    
    var properties: () -> ([Property]) { get }
    
    func render() -> String
    
}

extension Element {
    
    func render() -> String {
        properties().map { property in
            "\(property.value.0): \(property.value.1);"
        } .joined(separator: "\n")
    }
    
}

@resultBuilder
struct ElementBuilder {
    
    static func buildBlock(_ components: Element...) -> [Element] {
        components
    }
    
}
