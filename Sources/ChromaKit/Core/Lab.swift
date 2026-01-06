import Foundation

/// A Lab value in the CIELab color space
public struct Lab {
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
		let k = 24389.0/27.0
		let e = 216.0/24389.0
		
		let fy = (l + 16)/116
		let fx = fy + (a/500)
		let fz = fy - (b/200)
		
		let x = pow(fx, 3) > e ? pow(fx, 3) : (116 * fx - 16)/k
		let y = l > k * e      ? pow(fy, 3) : l/k
		let z = pow(fz, 3) > e ? pow(fz, 3) : (116 * fz - 16)/k
		
		let d65WhitePoint = (
			x: 0.3127/0.3290,
			y: 1.00000,
			z: (1.0 - 0.3127 - 0.3290) / 0.3290
		)
		
		return XYZ(
			x: x * d65WhitePoint.x,
			y: y * d65WhitePoint.y,
			z: z * d65WhitePoint.z
		)
	}
	
	// MARK: Sugar
	@inlinable
	public func p3() -> P3 {
		xyz().p3()
	}
}
