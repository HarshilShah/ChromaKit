import Foundation

/// A 3-element tuple used to represent a set of color components, such as `rgb`,` lab`, `lch`, and so on.
public typealias ColorComponents = (Double, Double, Double)

/// A 3x3 matrix used to perform color transformations
public struct ColorMatrix {
	@inlinable
	public init(x: ColorComponents, y: ColorComponents, z: ColorComponents) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	public var x: ColorComponents
	public var y: ColorComponents
	public var z: ColorComponents
}

extension ColorMatrix {
	@inlinable
	public func dotProduct(_ components: ColorComponents) -> ColorComponents {
		return (
			components.0 * x.0 + components.1 * x.1 + components.2 * x.2,
			components.0 * y.0 + components.1 * y.1 + components.2 * y.2,
			components.0 * z.0 + components.1 * z.1 + components.2 * z.2
		)
	}
}
