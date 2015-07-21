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

switch point1 {
		print("origin")

//: ---

let point2 = (1, 1)

switch point2 {
		print("point on x = y line")

//: ---

let point3: (Int, Int)? = (2, 3)

	print("point above x axis")

//: ---

let points1 = [
	(1, 2),
	(-3, 4),
	(5, -6),
	(-7, -8),
	(9, 10)

	print("point in 1st quadrant: (\(x), \(y))")

//: ---

let point4 = (4, 5)

	print("point on screen")

//: ---

let point5 = (-6, 7)

	print("point in 2nd quadrant")

//: ---

let points2: [(Int, Int)?] = [
	(1, 2),
	(-3, 4),
	(5, -6),
	(-7, -8),
	(9, 10)

	print("point in 3rd quadrant: (\(x), \(y))")

//: [Next: Reflection](@next)