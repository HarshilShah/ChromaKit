import Foundation

/// A 3-element tuple used to represent a set of color components, such as `rgb`,` lab`, `lch`, and so on.
typealias ColorComponents = (Double, Double, Double)

/// A 3x3 matrix used to perform color transformations
struct ColorMatrix {
	var x: ColorComponents
	var y: ColorComponents
	var z: ColorComponents
}

extension ColorMatrix {
	func dotProduct(_ components: ColorComponents) -> ColorComponents {
		return (
			components.0 * x.0 + components.1 * x.1 + components.2 * x.2,
			components.0 * y.0 + components.1 * y.1 + components.2 * y.2,
			components.0 * z.0 + components.1 * z.1 + components.2 * z.2
		)
	}
}
