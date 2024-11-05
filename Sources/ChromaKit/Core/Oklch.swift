import Foundation

/// An LCH value in the Oklch color space
public struct Oklch {

	// MARK: Properties
	
	public var l: Double
	public var c: Double
	public var h: Double

	// MARK: Conversions
	@inlinable
	public func oklab() -> Oklab {
		Oklab(
			l: l,
			a: cos(h * .pi / 180) * c,
			b: sin(h * .pi / 180) * c
		)
	}
	
	// MARK: Sugar
	@inlinable
	public func xyz() -> XYZ {
		oklab().xyz()
	}

	@inlinable
	public func p3() -> P3 {
		oklab().xyz().p3()
	}
}
