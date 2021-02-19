
struct HTML: Tag {
    
    let tag: String = "html"
    
    let content: () -> ([Tag])
    
    let args: [String: String] = [:]
    
    init(@TagBuilder content: @escaping () -> ([Tag])) {
        self.content = content
    }
    
}
