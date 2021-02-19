
struct Body: Tag {
    
    let tag: String = "body"
    
    let content: () -> ([Tag])
    
    let args: [String: String] = [:]
    
    init(@TagBuilder content: @escaping () -> ([Tag])) {
        self.content = content
    }
    
}
