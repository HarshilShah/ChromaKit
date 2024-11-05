import Foundation

/// An LCH value in the CIELch color space
public struct Lch {

	// MARK: Properties
	
	public var l: Double
	public var c: Double
	public var h: Double

	// MARK: Conversions
	@inlinable
	public func lab() -> Lab {
		Lab(
			l: l,
			a: cos(h * .pi / 180) * c,
			b: sin(h * .pi / 180) * c
		)
	}
	
	// MARK: Sugar
	@inlinable
	public func xyz() -> XYZ {
		lab().xyz()
	}

	@inlinable
	public func p3() -> P3 {
		lab().xyz().p3()
	}
}
