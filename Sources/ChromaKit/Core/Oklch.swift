import Foundation

/// An LCH value in the Oklch color space
struct Oklch {
	
	// MARK: Properties
	
	var l: Double
	var c: Double
	var h: Double
	
	// MARK: Conversions
	
	func oklab() -> Oklab {
		Oklab(
			l: l,
			a: cos(h * .pi / 180) * c,
			b: sin(h * .pi / 180) * c
		)
	}
	
	// MARK: Sugar
	
	func xyz() -> XYZ {
		oklab().xyz()
	}
	
	func p3() -> P3 {
		oklab().xyz().p3()
	}
}
