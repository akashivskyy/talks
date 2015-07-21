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



	let end: Point


}

let vector1 = Vector(start: (0, 0), end: (1, 1))

//: ---

extension Vector: CustomStringConvertible {


}

let vector2 = Vector(start: (-1, 2), end: (-3, 4))

//: ---

extension Vector: CustomReflectable {

		return Mirror(self, children: [
			"end": "\(end.x) × \(end.y)",
			"length": length
	}


let vector3 = Vector(start: (5, -6), end: (-7, 8))

//: ---

extension Vector: CustomPlaygroundQuickLookable {

		let bezierPath = UIBezierPath()

}

let vector4 = Vector(start: (-9, 10), end: (11, -12))

//: [Next: Objective-C Bridging](@next)