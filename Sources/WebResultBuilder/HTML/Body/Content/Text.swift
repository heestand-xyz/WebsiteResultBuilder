
extension String: Tag {
    
    var tag: String { "" }
    
    var args: [String: String] { [:] }
    
    var content: () -> ([Tag]) { { [] } }
    
    func render() -> String {
        self
    }
    
}
