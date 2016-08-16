
import XCTest
@testable import hello

class basicTests: XCTestCase {
    func testAdd() {
        XCTAssertEqual(hello.add(a: 1, b: 2), 3)
        XCTAssertEqual(hello.sub(a: 2, b: 1), 1)
    }
}
