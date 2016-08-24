
@inline(__always) func a() -> Bool {
  return true
}

@inline(never) func b() -> Bool {
  return false
}

print(a())
print(b())
