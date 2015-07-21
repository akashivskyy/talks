//: [Previous: Literal Convertibles](@previous)
//:
//: ---
//:
//: ## Interpolation Convertibles

//
//  sample-code.playground
//
//  Copyright (c) 2015 Adrian Kashivskyy. All rights reserved.
//

enum Byte: UInt8 {
	case Zero = 0
	case One = 1}

let byteString1 = "\(Byte.Zero)"

//: ---

extension String {
	init(stringInterpolationSegment byte: Byte) {
		self = "\(byte.rawValue)"	}

}

let byteString2 = "\(Byte.Zero)"

//: [Next: Pattern Matching](@next)
