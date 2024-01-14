import XCTest
@testable import ChromaKit

func XCTAssertEqualP3(
	_ a: P3,
	_ b: P3,
	accuracy: Double = 0.001,
	file: StaticString = #filePath,
	line: UInt = #line
) {
	XCTAssertEqual(a.r, b.r, accuracy: accuracy, file: file, line: line)
	XCTAssertEqual(a.g, b.g, accuracy: accuracy, file: file, line: line)
	XCTAssertEqual(a.b, b.b, accuracy: accuracy, file: file, line: line)
}

final class ChromaKitTests: XCTestCase {
	let nativeP3 = P3(r: 0.8, g: 0.6, b: 0.4)
	
    func testLch() throws {
		let lch = Lch(l: 67.21298, c: 43.18819, h: 66.09192)
		XCTAssertEqualP3(lch.p3(), nativeP3)
    }
	
	func testOklch() throws {
		let oklch = Oklch(l: 0.72385, c: 0.10601, h: 62.26385)
		print(oklch.xyz())
		XCTAssertEqualP3(oklch.p3(), nativeP3)
	}
	
    func testLab() throws {
		let lab = Lab(l: 67.21298, a: 17.5029, b: 39.48251)
		XCTAssertEqualP3(lab.p3(), nativeP3)
    }
	
    func testOklab() throws {
		let oklab = Oklab(l: 0.72385, a: 0.04934, b: 0.09383)
		print(oklab.xyz())
		XCTAssertEqualP3(oklab.p3(), nativeP3)
    }
}
