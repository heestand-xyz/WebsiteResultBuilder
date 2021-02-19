
struct Head: Tag {
    
    let tag: String = "head"
    
    let content: () -> ([Tag])
    
    let args: [String: String] = [:]
    
    init(@TagBuilder content: @escaping () -> ([Tag])) {
        self.content = content
    }
    
}
