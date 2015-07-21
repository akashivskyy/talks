//: ## Literal Convertibles

//
//  sample-code.playground
//
//  Copyright (c) 2015 Adrian Kashivskyy. All rights reserved.
//

struct RegularExpression {

	let pattern: String
	
	init(pattern: String) {
		self.pattern = pattern
	}

}

let emailRegex1 = RegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$")

//: ---

extension RegularExpression: StringLiteralConvertible {

	typealias UnicodeScalarLiteralType = UnicodeScalarType	typealias ExtendedGraphemeClusterLiteralType = Swift.StringLiteralType
	typealias StringLiteralType = Swift.StringLiteralType
	init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
		self.pattern = "\(value)"
	}

	init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
		self.pattern = value
	}

	init(stringLiteral value: StringLiteralType) {
		self.pattern = value
	}

}

let emailRegex2: RegularExpression = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"

//: [Next: Interpolation Convertibles](@next)
