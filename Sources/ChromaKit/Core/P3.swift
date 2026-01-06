import Foundation

/// An RGB value in the display P3 color space
public struct P3 {
	@inlinable
	public init(r: Double, g: Double, b: Double) {
		self.components = ColorComponents(r, g, b)
	}

	@inlinable
	public init(_ components: ColorComponents) {
		self.components = components
	}

	// MARK: Properties
	public var components: ColorComponents

	@inlinable public var r: Double { components.x }
	@inlinable public var g: Double { components.y }
	@inlinable public var b: Double { components.z }

	// MARK: Methods
	@inlinable
	public func gammaCorrected() -> P3 {
		P3(r: gammaCorrected(r), g: gammaCorrected(g), b: gammaCorrected(b))
	}

	@inlinable
	public func gammaCorrected(_ c: Double) -> Double {
		let sign = c.sign == .plus ? 1.0 : -1.0
		
		if abs(c) > 0.0031308 {
			return sign * (1.055 * pow(abs(c), 1/2.4) - 0.055)
		}
		
		return 12.92 * c
	}
}
