import Foundation

/// A LAB value in the Oklab color space
struct Oklab {
	
	// MARK: Properties
	
	var l: Double
	var a: Double
	var b: Double
	
	// MARK: Conversions
	
	func xyz() -> XYZ {
		let lmsToXyz = ColorMatrix(
			x: ( 1.2268798733741557,  -0.5578149965554813,  0.28139105017721583),
			y: (-0.04057576262431372,  1.1122868293970594, -0.07171106666151701),
			z: (-0.07637294974672142, -0.4214933239627914,  1.5869240244272418)
		)
		
		let oklabToLms = ColorMatrix(
			x: (0.99999999845051981432,  0.39633779217376785678,   0.21580375806075880339),
			y: (1.0000000088817607767,  -0.1055613423236563494,   -0.063854174771705903402),
			z: (1.0000000546724109177,  -0.089484182094965759684, -1.2914855378640917399)
		)
		
		let lms = oklabToLms.dotProduct((l, a, b))
		let (x, y, z) = lmsToXyz.dotProduct((pow(lms.0, 3), pow(lms.1, 3), pow(lms.2, 3)))
		return XYZ(x: x, y: y, z: z)
	}
	
	// MARK: Sugar
	
	func p3() -> P3 {
		xyz().p3()
	}
}
