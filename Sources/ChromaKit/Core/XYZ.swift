import Foundation

/// An XYZ value in the XYZ color space
public struct XYZ {
	@inlinable
	public init(x: Double, y: Double, z: Double) {
		self.components = ColorComponents(x, y, z)
	}

	@inlinable
	public init(_ components: ColorComponents) {
		self.components = components
	}

	// MARK: Properties
	public var components: ColorComponents

	@inlinable public var x: Double { components.x }
	@inlinable public var y: Double { components.y }
	@inlinable public var z: Double { components.z }

	// MARK: Conversions
	@inlinable
	public func p3() -> P3 {
		let xyzToLinearP3 = ColorMatrix(
			x: ColorComponents(446124/178915, -333277/357830,   -72051/178915),
			y: ColorComponents(-14852/17905,    63121/35810,       423/17905),
			z: ColorComponents( 11844/330415,  -50337/660830,   316169/330415)
		)
		
		let rgb = xyzToLinearP3.dotProduct(components)
		return P3(rgb).gammaCorrected()
	}
}
