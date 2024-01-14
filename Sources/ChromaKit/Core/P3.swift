import Foundation

/// An RGB value in the display P3 color space
struct P3 {
	
	// MARK: Properties
	
	var r: Double
	var g: Double
	var b: Double
	
	// MARK: Methods
	
	func gammaCorrected() -> P3 {
		P3(r: gammaCorrected(r), g: gammaCorrected(g), b: gammaCorrected(b))
	}
	
	func gammaCorrected(_ c: Double) -> Double {
		let sign = c.sign == .plus ? 1.0 : -1.0
		
		if abs(c) > 0.0031308 {
			return sign * (1.055 * pow(abs(c), 1/2.4) - 0.055)
		}
		
		return 12.92 * c
	}
}
