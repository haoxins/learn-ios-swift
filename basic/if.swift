
// must optional

let a:Int? = 1
let b:Int? = 1

if let x = a, y = b {
  if x == y {
    print("equal")
  }
}

// ->

if let x = a, y = b where x == y {
  print("equal")
}
