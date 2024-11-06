import Foundation

/// An LCH value in the Oklch color space
public struct Oklch {
	@inlinable
	public init(l: Double, c: Double, h: Double) {
		self.l = l
		self.c = c
		self.h = h
	}
	

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
