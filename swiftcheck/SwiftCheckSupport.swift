//
// SwiftCheckSupport.swift
//
// Copyright © 2016 Netguru Sp. z o.o. All rights reserved.
// Licensed under the MIT License.
//
// This source file contains integration support between `SwiftCheck`, `Quick`
// and `Nimble`. The result of that integration is the ability to use `to` and
// `toNot` matchers inside `property` assertions that are integrated with `it`
// test cases:
//
//     sc_it("unsigned integers should be greater or equal zero") {
//         forAll { (x: UInt) in
//             expect(x).sc_toNot(beLessThan(0))
//         }
//     }
//
// Default `it`, `to`, `toNot` and `property` functions remain unaffected and
// not overloaded.
//

import Nimble
import Quick
import SwiftCheck

internal extension Expectation {

	/// Evaluates the expectation with a matcher and returns a
	/// `SwiftCheck.Testable` result instead of asserting it in a handler.
	///
	/// - Parameters:
	///     - matcher: The matcher to use.
	///     - description: An optional expectation description.
	///
	/// - Returns: A `SwiftCheck.Testable` result that can be returned as a
	///   result of a quantifier.
	internal func sc_to<M>(_ matcher: M, description: String? = nil) -> SwiftCheck.Testable where M: Nimble.Matcher, M.ValueType == T {
		return sc_testable(matcher: matcher, userDescription: description, toDescription: "to") { matcher, expression, message in
			try matcher.matches(expression, failureMessage: message)
		}
	}

	/// Evaluates the expectation with a matcher and returns a
	/// `SwiftCheck.Testable` result instead of asserting it in a handler.
	///
	/// - Parameters:
	///     - matcher: The matcher to use.
	///     - description: An optional expectation description.
	///
	/// - Returns: A `SwiftCheck.Testable` result that can be returned as a
	///   result of a quantifier.
	internal func sc_toNot<M>(_ matcher: M, description: String? = nil) -> SwiftCheck.Testable where M: Nimble.Matcher, M.ValueType == T {
		return sc_testable(matcher: matcher, userDescription: description, toDescription: "to not") { matcher, expression, message in
			try matcher.doesNotMatch(expression, failureMessage: message)
		}
	}

	private func sc_testable<M>(matcher: M, userDescription: String?, toDescription: String, execute: (_ matcher: M, _ expression: Expression<T>, _ message: FailureMessage) throws -> Bool) -> Testable where M: Nimble.Matcher, M.ValueType == T {
		let message = Nimble.FailureMessage()
		message.userDescription = userDescription
		message.to = toDescription
		do {
			if try matcher.matches(expression, failureMessage: message) {
				return SwiftCheck.TestResult.succeeded
			} else {
				message.actualValue = "<\(stringify(try expression.evaluate()))>"
				return SwiftCheck.TestResult.failed(message.stringValue)
			}
		} catch let error {
			message.actualValue = "an unexpected error thrown: <\(error)>"
			return SwiftCheck.TestResult.failed(message.stringValue)
		}
	}

}

// MARK: -

/// Creates a `SwiftCheck` property wrapped in a `Quick` test case. This makes
/// `property` tests conform to `Quick` world, and makes them compatible with
/// spec structure (e.g. makes them respect `beforeEach`, etc.).
///
/// - Parameters:
///     - description: Description of the test case.
///     - arguments: The checker arguments for replaying tests.
///     - flags: Flags to filter examples or example groups.
///     - file: Source file where the call was made.
///     - line: Line at which the call was made.
///     - closure: A closure acting as a test body.
internal func sc_it(_ description: String, arguments: SwiftCheck.CheckerArguments? = nil, flags: Quick.FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> SwiftCheck.Property) {
	it(description, flags: flags, file: String(describing: file), line: line) {
		property(description, arguments: arguments, file: file, line: line) <- closure()
	}
}
