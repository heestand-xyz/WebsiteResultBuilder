
struct Class: Element {
    
    let prefix: String = "."

    let name: String

    let properties: () -> ([Property])
    
    init(name: String, @PropertyBuilder properties: @escaping () -> ([Property])) {
        self.name = name
        self.properties = properties
    }

}
