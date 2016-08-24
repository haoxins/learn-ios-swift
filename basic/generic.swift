
func equal<Type: Equatable>(a: Type, b: Type) -> Bool {
  return a == b
}

print(equal(a: "xx", b: "oo"))

print(equal(a: 11, b: 11))
