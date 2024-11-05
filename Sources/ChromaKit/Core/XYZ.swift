import Foundation

/// An XYZ value in the XYZ color space
public struct XYZ {
	@inlinable
	public init(x: Double, y: Double, z: Double) {
		self.x = x
		self.y = y
		self.z = z
	}


	// MARK: Properties
	
	public var x: Double
	public var y: Double
	public var z: Double

	// MARK: Conversions

	@inlinable
	public func p3() -> P3 {
		let xyzToLinearP3 = ColorMatrix(
			x: (446124/178915, -333277/357830,   -72051/178915),
			y: (-14852/17905,    63121/35810,       423/17905),
			z: ( 11844/330415,  -50337/660830,   316169/330415)
		)
		
		let (r, g, b) = xyzToLinearP3.dotProduct((x, y, z))
		return P3(r: r, g: g, b: b).gammaCorrected()
	}
}
