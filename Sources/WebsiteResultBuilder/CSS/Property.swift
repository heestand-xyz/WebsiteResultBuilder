import CoreGraphics

enum Property {
    
    enum Position: String {
        case `static`
        case absolute
        case fixed
        case relative
        case sticky
        case initial
        case inherit
    }
    case position(Position)
    
    enum Color {
        case black
        case white
        case gray
        case grey
        case red
        case yellow
        case green
        case cyan
        case blue
        case magenta
        case rgb(CGFloat, CGFloat, CGFloat)
        case rgba(CGFloat, CGFloat, CGFloat, CGFloat)
        case hex(String)
        var rawValue: String {
            switch self {
            case .black:
                return "black"
            case .white:
                return "white"
            case .gray:
                return "gray"
            case .grey:
                return "grey"
            case .red:
                return "red"
            case .yellow:
                return "yellow"
            case .green:
                return "green"
            case .cyan:
                return "cyan"
            case .blue:
                return "blue"
            case .magenta:
                return "magenta"
            case .rgb(let red, let green, let blue):
                return "rgb(\(Int(round(red * 255))), \(Int(round(green * 255)))\(Int(round(blue * 255))))"
            case .rgba(let red, let green, let blue, let alpha):
                return "rgb(\(Int(round(red * 255))), \(Int(round(green * 255)))\(Int(round(blue * 255))), \(alpha))"
            case .hex(let hex):
                return hex.first == "#" ? hex : "#\(hex)"
            }
        }
    }
    case color(Color)
    case backgroundColor(Color)
    
    var value: (String, String) {
        switch self {
        case .position(let value):
            return ("position", value.rawValue)
        case .color(let value):
            return ("color", value.rawValue)
        case .backgroundColor(let value):
            return ("background-color", value.rawValue)
        }
    }
    
}

@resultBuilder
struct PropertyBuilder {
    
    static func buildBlock(_ components: Property...) -> [Property] {
        components
    }
    
}
