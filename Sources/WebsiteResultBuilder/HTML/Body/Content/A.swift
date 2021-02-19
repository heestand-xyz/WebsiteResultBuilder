
struct A: Tag {
    
    let tag: String = "a"
    
    let content: () -> ([Tag])
    
    var args: [String: String] = [:]
    
    init(id: String? = nil,
         class: String? = nil,
         href: String,
         @TagBuilder content: @escaping () -> ([Tag])) {
        args["id"] = id
        args["class"] = `class`
        args["href"] = href
        self.content = content
    }
    
}
