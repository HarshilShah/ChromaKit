import Foundation

/// A LAB value in the Oklab color space
public struct Oklab {
	@inlinable
	public init(l: Double, a: Double, b: Double) {
		self.components = ColorComponents(l, a, b)
	}

	@inlinable
	public init(_ components: ColorComponents) {
		self.components = components
	}

	// MARK: Properties
	public var components: ColorComponents

	@inlinable public var l: Double { components.x }
	@inlinable public var a: Double { components.y }
	@inlinable public var b: Double { components.z }

	// MARK: Conversions
	@inlinable
	public func xyz() -> XYZ {
		let lmsToXyz = ColorMatrix(
			x: ColorComponents(1.2268798733741557,  -0.5578149965554813,  0.28139105017721583),
			y: ColorComponents(-0.04057576262431372,  1.1122868293970594, -0.07171106666151701),
			z: ColorComponents(-0.07637294974672142, -0.4214933239627914,  1.5869240244272418)
		)
		
		let oklabToLms = ColorMatrix(
			x: ColorComponents(0.99999999845051981432,  0.39633779217376785678,   0.21580375806075880339),
			y: ColorComponents(1.0000000088817607767,  -0.1055613423236563494,   -0.063854174771705903402),
			z: ColorComponents(1.0000000546724109177,  -0.089484182094965759684, -1.2914855378640917399)
		)
		
		let lms = oklabToLms.dotProduct(components)
		let xyz = lmsToXyz.dotProduct(ColorComponents(pow(lms.x, 3), pow(lms.y, 3), pow(lms.z, 3)))
		return XYZ(xyz)
	}
	
	// MARK: Sugar
	@inlinable
	public func p3() -> P3 {
		xyz().p3()
	}
}
