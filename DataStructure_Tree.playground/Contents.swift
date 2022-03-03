import Foundation

class Node {
    var value: String
    var parentNode: Node?
    var childNodes: [Node] = []
    
    init(_ value: String) {
        self.value = value
    }
    
    func add(child: Node){
        childNodes.append(child)
        child.parentNode = self
    }
}

extension Node: CustomStringConvertible{
    var description: String {
        var text = "\(value)"
        if !(childNodes.isEmpty) {
            text += "{" + childNodes.map{$0.description}.joined(separator: ",") + "}"
        }
        return text
    }
}

var devices = Node("Devices")
let apple = Node("Apple")
let android = Node("Android")
devices.add(child: apple)
devices.add(child: android)

print(devices)
