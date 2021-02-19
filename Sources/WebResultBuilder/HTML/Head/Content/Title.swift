
struct Title: Tag {
    
    let tag: String = "title"
    
    let content: () -> ([Tag])
    
    var args: [String: String] = [:]
    
    init(_ title: String) {
        self.content = { [title] }
    }
    
}
