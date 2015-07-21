//: [Previous: Reflection](@previous)
//:
//: ---
//:
//: ## Objective-C Bridging

//
//  sample-code.playground
//
//  Copyright (c) 2015 Adrian Kashivskyy. All rights reserved.
//

import Foundation
@objc class ObjcPoint: NSObject {

	var x: Double
	var y: Double

	init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}

}

struct SwiftPoint {

	let x: Double
	let y: Double

}

//: ---

extension SwiftPoint: _ObjectiveCBridgeable {

	typealias _ObjectiveCType = ObjcPoint

	static func _isBridgedToObjectiveC() -> Bool {
		return true
	}

	static func _getObjectiveCType() -> Any.Type {
		return _ObjectiveCType.self
	}

	func _bridgeToObjectiveC() -> _ObjectiveCType {
		return ObjcPoint(x: x, y: y)
	}

	static func _forceBridgeFromObjectiveC(source: _ObjectiveCType, inout result: SwiftPoint?) {
		result = SwiftPoint(x: source.x, y: source.y)
	}

	static func _conditionallyBridgeFromObjectiveC(source: _ObjectiveCType, inout result: SwiftPoint?) -> Bool {
		_forceBridgeFromObjectiveC(source, result: &result)
		return true
	}
	
}

//: ---
let objcPoint1 = ObjcPoint(x: 1, y: 2)let swiftPoint1 = objcPoint1 as SwiftPoint

let swiftPoint2 = SwiftPoint(x: 3, y: 4)let objcPoint2 = swiftPoint2 as ObjcPoint
let objcPoint3: ObjcPoint = SwiftPoint(x: 5, y: 6)
