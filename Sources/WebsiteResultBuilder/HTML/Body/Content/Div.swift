
struct Div: Tag {
    
    let tag: String = "div"
    
    let content: () -> ([Tag])
    
    var args: [String: String] = [:]
    
    init(id: String? = nil,
         class: String? = nil,
         @TagBuilder content: @escaping () -> ([Tag])) {
        args["id"] = id
        args["class"] = `class`
        self.content = content
    }
    
}
