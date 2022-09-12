//
//  HorizontalPairConstraintsTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 12.08.2022.
//  Copyright © 2022 Maxim Shurkin
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

@testable import AnchorKit
import XCTest

class HorizontalPairConstraintsTests: XCTestCase {
    private var superview: UIView!
    private var view: UIView!

    override func setUp() {
        super.setUp()

        view = UIView()
        superview = UIView()
        superview.addSubview(view)
    }

    override func tearDown() {
        view = nil
        superview = nil

        super.tearDown()
    }
}

extension HorizontalPairConstraintsTests {
    func testEqualityForHorizontalAnchors() {
        let constraints = view.horizontalAnchors == superview.horizontalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .leading)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .leading)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .trailing)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .trailing)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForHorizontalAnchors() {
        let constraints = view.horizontalAnchors >= superview.horizontalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .leading)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .leading)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .trailing)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .trailing)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForHorizontalAnchors() {
        let constraints = view.horizontalAnchors <= superview.horizontalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .leading)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .leading)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .trailing)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .trailing)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForHorizontalAbsoluteAnchors() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) == superview.horizontalAnchors(.absolute)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForHorizontalAbsoluteAnchors() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) >= superview.horizontalAnchors(.absolute)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForHorizontalAbsoluteAnchors() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) <= superview.horizontalAnchors(.absolute)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForHorizontalAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors == superview.horizontalAnchors + UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .leading)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .leading)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 16)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .trailing)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .trailing)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 8)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForHorizontalAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) >= superview.horizontalAnchors(.absolute) + 8 + UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8) ~ 250
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 16)
        XCTAssertEqual(constraints[0].priority, .defaultLow)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .defaultLow)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForHorizontalAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors <= superview.horizontalAnchors * 2 + NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16) ~ .defaultHigh + 1
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .leading)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .leading)
        XCTAssertEqual(constraints[0].multiplier, 2)
        XCTAssertEqual(constraints[0].constant, 16)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(751))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .trailing)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .trailing)
        XCTAssertEqual(constraints[1].multiplier, 2)
        XCTAssertEqual(constraints[1].constant, 16)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(751))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForHorizontalAbsoluteAndAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) == superview.horizontalAnchors(.absolute) + UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 16)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 8)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForHorizontalAbsoluteAndAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) >= 3 * superview.horizontalAnchors(.absolute) - UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) ~ 250
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 0.33333, accuracy: 0.00001)
        XCTAssertEqual(constraints[0].constant, 2.666_667, accuracy: 0.000_001)
        XCTAssertEqual(constraints[0].priority, .defaultLow)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 0.33333, accuracy: 0.00001)
        XCTAssertEqual(constraints[1].constant, 2.666_667, accuracy: 0.000_001)
        XCTAssertEqual(constraints[1].priority, .defaultLow)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForHorizontalAbsoluteAndAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.horizontalAnchors(.absolute) <= superview.horizontalAnchors(.absolute) / 2 + NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24) ~ .defaultHigh + 1
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .left)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .left)
        XCTAssertEqual(constraints[0].multiplier, 0.5)
        XCTAssertEqual(constraints[0].constant, 24)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(751))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .right)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .right)
        XCTAssertEqual(constraints[1].multiplier, 0.5)
        XCTAssertEqual(constraints[1].constant, 24)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(751))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }
}
