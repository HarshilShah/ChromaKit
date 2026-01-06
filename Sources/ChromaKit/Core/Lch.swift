import Foundation

/// An LCH value in the CIELch color space
public struct Lch {
	@inlinable
	public init(l: Double, c: Double, h: Double) {
		self.components = ColorComponents(l, c, h)
	}

	@inlinable
	public init(_ components: ColorComponents) {
		self.components = components
	}

	// MARK: Properties
	public var components: ColorComponents

	@inlinable public var l: Double { components.x }
	@inlinable public var c: Double { components.y }
	@inlinable public var h: Double { components.z }

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
