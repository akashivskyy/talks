//: [Previous: Interpolation Convertibles](@previous)
//:
//: ---
//:
//: ## Pattern Matching

//
//  sample-code.playground
//
//  Copyright (c) 2015 Adrian Kashivskyy. All rights reserved.
//

let point1 = (0, 0)

switch point1 {	case (0, 0):
		print("origin")	default:		print("arbitrary point")}

//: ---

let point2 = (1, 1)

switch point2 {	case let (x, y) where x == y:
		print("point on x = y line")	default:		print("arbitrary point")}

//: ---

let point3: (Int, Int)? = (2, 3)
if let (_, y) = point3 where y > 0 {
	print("point above x axis")}

//: ---

let points1 = [
	(1, 2),
	(-3, 4),
	(5, -6),
	(-7, -8),
	(9, 10)]
for (x, y) in points1 where x > 0 && y > 0 {
	print("point in 1st quadrant: (\(x), \(y))")}

//: ---

let point4 = (4, 5)let (width, height) = (320, 480)
if case (0 ... width, 0 ... height) = point4 {
	print("point on screen")}

//: ---

let point5 = (-6, 7)
if case let (x, 1 ..< Int.max) = point5 where x < 0 {
	print("point in 2nd quadrant")}

//: ---

let points2: [(Int, Int)?] = [
	(1, 2),
	(-3, 4),
	(5, -6),
	(-7, -8),
	(9, 10)]
for case .Some(let (x, y)) in points2 where x < 0 && y < 0 {
	print("point in 3rd quadrant: (\(x), \(y))")}

//: [Next: Reflection](@next)
