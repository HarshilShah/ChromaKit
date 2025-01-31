#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension NSColor {
	/// Creates a constant color in the CIELch color space
	///
	/// - Parameters:
	///   - l: A lightness value in the range 0 to 100, with 0 being the darkest, and 100 being the brightest
	///   - c: A chroma value that is greater than 0, and with a theoretically unbounded maximum (practically, 230). Higher values represent a higher "amount" of colour
	///   - h: A hue value in the range 0 to 360 that maps to the color wheel.
	///   - alpha: An optional degree of opacity, in the range 0 to 1, with 0 being fully transparent, and 1 being fully opaque.The default is 1.
	static func lch(
		_ l: Double,
		_ c: Double,
		_ h: Double,
		_ alpha: Double = 1.0
	) -> NSColor {
		let p3 = Lch(l: l, c: c, h: h).p3()
		return NSColor(displayP3Red: p3.r, green: p3.g, blue: p3.b, alpha: alpha)
	}
	
	/// Creates a constant color in the Oklch color space
	///
	/// - Parameters:
	///   - l: A lightness value in the range 0 to 1, with 0 being the darkest, and 1 being the brightest
	///   - c: A chroma value that is greater than 0, and with a theoretically unbounded maximum (practically, 0.5). Higher values represent a higher "amount" of colour
	///   - h: A hue value in the range 0 to 360 that maps to the color wheel.
	///   - alpha: An optional degree of opacity, in the range 0 to 1, with 0 being fully transparent, and 1 being fully opaque.The default is 1.
	static func oklch(
		_ l: Double,
		_ c: Double,
		_ h: Double,
		_ alpha: Double = 1.0
	) -> NSColor {
		let p3 = Oklch(l: l, c: c, h: h).p3()
		return NSColor(displayP3Red: p3.r, green: p3.g, blue: p3.b, alpha: alpha)
	}
	
	/// Creates a constant color in the CIELab color space
	///
	/// - Parameters:
	///   - l: A lightness value in the range 0 to 100, with 0 being the darkest, and 100 being the brightest
	///   - a: A number between -125 and 125, which specifies the distance along the a axis in the CIELab colorspace, that is how green/red the color is
	///   - b: A number between -125 and 125, which specifies the distance along the b axis in the CIELab colorspace, that is how blue/yellow the color is
	///   - alpha: An optional degree of opacity, in the range 0 to 1, with 0 being fully transparent, and 1 being fully opaque.The default is 1.
	static func lab(
		_ l: Double,
		_ a: Double,
		_ b: Double,
		_ alpha: Double = 1.0
	) -> NSColor {
		let p3 = Lab(l: l, a: a, b: b).p3()
		return NSColor(displayP3Red: p3.r, green: p3.g, blue: p3.b, alpha: alpha)
	}
	
	/// Creates a constant color in the Oklab color space
	///
	/// - Parameters:
	///   - l: A lightness value in the range 0 to 1, with 0 being the darkest, and 1 being the brightest
	///   - a: A number between -0.4 and 0.4, which specifies the distance along the a axis in the Oklab colorspace, that is how green/red the color is
	///   - b: A number between -0.4 and 0.4, which specifies the distance along the b axis in the Oklab colorspace, that is how blue/yellow the color is
	///   - alpha: An optional degree of opacity, in the range 0 to 1, with 0 being fully transparent, and 1 being fully opaque.The default is 1.
	static func oklab(
		_ l: Double,
		_ a: Double,
		_ b: Double,
		_ alpha: Double = 1.0
	) -> NSColor {
		let p3 = Oklab(l: l, a: a, b: b).p3()
		return NSColor(displayP3Red: p3.r, green: p3.g, blue: p3.b, alpha: alpha)
	}
}
#endif
