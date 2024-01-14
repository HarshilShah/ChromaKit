import Foundation

/// An LCH value in the CIELch color space
struct Lch {
	
	// MARK: Properties
	
	var l: Double
	var c: Double
	var h: Double
	
	// MARK: Conversions
	
	func lab() -> Lab {
		Lab(
			l: l,
			a: cos(h * .pi / 180) * c,
			b: sin(h * .pi / 180) * c
		)
	}
	
	// MARK: Sugar
	
	func xyz() -> XYZ {
		lab().xyz()
	}
	
	func p3() -> P3 {
		lab().xyz().p3()
	}
}
