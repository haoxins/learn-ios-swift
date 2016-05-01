
import Foundation

print("Hello, World!")

let i1 = 123 // const
var i2 = 123
i2 = 234

var i3 = 12.3
var i4:Double = 12.3

var s1 = "hello"
var s2 = s1 + String(i2)
var s3 = "haoxin says \(s1)"

var a1 = ["a", "b", "c"]
print(a1[1])

var a2 = [
    "name": "haoxin"
]
print(a2["name"])

var emptyArray = [String]()
var emptyDict = [String: Float]()

var optionalHello:String? = "hello"
var optionalName:String? = "haoxin"

if let name = optionalName {
    print(name)
}

if let hello = optionalHello where hello.hasPrefix("hello"), let name = optionalName {
    print("\(hello), \(name)")
}

// loop
for i in [1, 2, 3] {
    if i > 2 {
        print("> 2")
    } else {
        print("<= 2")
    }
}

for (k, v) in [
    "a": ["a1", "a2"],
    "b": ["b1", "b2"],
    ] {
        for s in v {
            print(s)
        }
}

print("0, 1, 2, 3")
for var i in 0.stride(to: 4, by: 1) {
    print(i)
}

print("0, 1, 2, 3")
for i in 0..<4 {
    print(i)
}

print("0, 1, 2, 3, 4")
for i in 0...4 {
    print(i)
}

var x = 2
while x < 100 {
    x = x * 2
}
print(x)

var y = 2
repeat {
    y = y * 2
} while y < 100
print(y)

// switch
let type = "a!"
switch type {
case "a":
    print("-> a")
case "b", "c":
    print("-> b, c")
case let x where x.hasSuffix("!"):
    print("\(x) ends with !")
default:
    print("-> default")
}

// func
func add(a: Int32, b: Int32) -> Int32 {
    return a + b
}
print(add(123, b: 456))

func out() -> (start: String, end: String) {
    return ("a", "z")
}
out()

_ = [1, 3, 5, 7, 9].map({
    (n: Int) -> Int in
    return n + 1
})

// class

class User {
    var name: String

    init(name: String) {
        self.name = name
    }

    func show() {
        print("my name is \(name)")
    }
}

var u1 = User(name: "haoxin")
u1.show()

class Member: User {
    var point: Int
    var _money: Int = 0

    init(name: String, point: Int) {
        self.point = point
        super.init(name: name)
    }

    func addPoint(num: Int) {
        point += num
    }

    var money: Double {
        set {
            _money = Int(money * 100)
        }
        get {
            return Double(_money) / 100
        }
    }

    override func show() {
        print("my name is \(name)" + ", point is " + String(point))
    }
}

var m1 = Member(name: "haoxin", point: 123)
m1.addPoint(234)
m1.show()

// struct
struct Person {
    var name: String

    func show() {
        print(name)
    }
}

var p1 = Person(name: "haoxin")
p1.show()

// protocol
protocol ExamplePro {
    var desc: String { get }
    mutating func show()
}

class ExampleClass: ExamplePro {
    var desc: String = "xxoo"
    func show() {
        print(desc)
    }
}

var e1 = ExampleClass()
e1.show()

struct ExampleStruct: ExamplePro {
    var desc: String = "ooxx"
    mutating func show() {
        // note: mutating marks a method modifies the structure (no need here)
        print(desc)
    }
}

var e2 = ExampleStruct()
e2.show()

// extension
extension Int: ExamplePro {
    var desc: String {
        return "number is \(self)"
    }

    mutating func show() {
        self += 9
    }
}

print(9.desc)

extension String {
    var kiku : String {
        let shortName = String(characters.dropFirst(1))
        return "\(self) K\(shortName) kiku O\(shortName)"
	}
}

print("Hello".kiku)
// generic

func `repeat`<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<times {
        result.append(item)
    }
    return result
}

var g1 = `repeat`("xxx", times: 4)
print(g1)

var g2 = `repeat`(123, times: 4)
print(g2)

// callback

func dosome(a: Int, b: Int, added: (result: Int) -> Void) {
    added(result: a + b)
}

// 1

dosome(123, b: 456, added: {
    (result: Int) in
        print(result)
})

// 2

dosome(123, b: 456) {
    (result: Int) in
        print(result)
}
