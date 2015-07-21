//: [Previous: Pattern Matching](@previous)
//:
//: ---
//:
//: ## Reflection

//
//  sample-code.playground
//
//  Copyright (c) 2015 Adrian Kashivskyy. All rights reserved.
//

import UIKit
struct Vector {
	typealias Point = (x: Double, y: Double)
	let start: Point
	let end: Point
	var length: Double {		return sqrt(pow(end.x - start.x, 2) + pow(end.y - start.y, 2))	}

}

let vector1 = Vector(start: (0, 0), end: (1, 1))

//: ---

extension Vector: CustomStringConvertible {
	var description: String {		return "(\(start.x) × \(start.y)) → (\(end.x) × \(end.y))"	}

}

let vector2 = Vector(start: (-1, 2), end: (-3, 4))

//: ---

extension Vector: CustomReflectable {
	func customMirror() -> Mirror {
		return Mirror(self, children: [			"start": "\(start.x) × \(start.y)",
			"end": "\(end.x) × \(end.y)",
			"length": length		])
	}
}

let vector3 = Vector(start: (5, -6), end: (-7, 8))

//: ---

extension Vector: CustomPlaygroundQuickLookable {
	func customPlaygroundQuickLook() -> PlaygroundQuickLook {
		let bezierPath = UIBezierPath()		// draw the path		return .BezierPath(bezierPath)	}

}

let vector4 = Vector(start: (-9, 10), end: (11, -12))

//: [Next: Objective-C Bridging](@next)
