
struct CSS {
    
    let elements: () -> ([Element])
    
    init(@ElementBuilder elements: @escaping () -> ([Element])) {
        self.elements = elements
    }
    
    func render() -> String {
        elements().map { element in
            let raw: String = element.render()
                .components(separatedBy: "\n")
                .map({ "\t\($0)" })
                .joined(separator: "\n")
            return """
            \(element.prefix)\(element.name) {
            \(raw)
            }
            """
        } .joined(separator: "\n\n")
    }
    
}
