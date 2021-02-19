
struct Link: Tag {
    
    let tag: String = "link"
    
    let content: () -> ([Tag]) = { [] }
    
    var args: [String: String] = [:]
    
    init(rel: String, href: String) {
        args["rel"] = rel
        args["href"] = href
    }
    
}
