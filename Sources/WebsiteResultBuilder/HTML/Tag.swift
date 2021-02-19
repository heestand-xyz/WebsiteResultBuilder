import Foundation

protocol Tag {
    
    var tag: String { get }
    
    var args: [String: String] { get }
    
    var content: () -> ([Tag]) { get }
    
    func render() -> String
    
}

extension Tag {
    
    func render() -> String {
        
        var rawArgs = ""
        for arg in args {
            rawArgs += " \(arg.key)=\"\(arg.value)\""
        }
        
        let content: [Tag] = content()
        if content.isEmpty {
            return "<\(tag)\(rawArgs != "" ? "\(rawArgs) " : "")/>"
        }
        
        let rawContent: String = content.map { tag in
            let subRaw: String = tag.render()
            let subRows: [String] = subRaw.components(separatedBy: "\n")
            return subRows.map({ "\t\($0)" }).joined(separator: "\n")
        } .joined(separator: "\n")
        return """
        <\(tag)\(rawArgs)>
        \(rawContent)
        </\(tag)>
        """
        
    }
    
}

@resultBuilder
struct TagBuilder {
    
    static func buildBlock(_ components: Tag...) -> [Tag] {
        components
    }
    
}
