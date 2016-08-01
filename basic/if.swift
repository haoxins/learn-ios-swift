
// must optional

let a:Int? = 1
let b:Int? = 1

if let x = a, let y = b {
  if x == y {
    print("equal")
  }
}

// ->

if let x = a, let y = b, x == y {
  print("equal")
}
