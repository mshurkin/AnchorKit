//
//  AnchorConstraintsTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018-2022 Maxim Shurkin
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

class AnchorConstraintsTests: XCTestCase {
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

// MARK: - X Axis

extension AnchorConstraintsTests {
    func testEqualityForXAxisAnchor() {
        let constraint = view.leadingAnchor == superview.leadingAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForXAxisAnchor() {
        let constraint = view.trailingAnchor >= superview.trailingAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForXAxisAnchor() {
        let constraint = view.leftAnchor <= superview.rightAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .left)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .right)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForXAxisAttribute() {
        let constraint = view.centerXAnchor == superview.centerXAnchor / 2 + 16
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .centerX)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .centerX)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForXAxisAttribute() {
        let constraint = view.leadingAnchor >= 0.5 * superview.trailingAnchor + 24
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 24)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForXAxisAttribute() {
        let constraint = view.trailingAnchor <= 3 * superview.centerXAnchor / 2 - 16 ~ 251
        XCTAssertIdentical(constraint.firstItem, superview)
        XCTAssertEqual(constraint.firstAttribute, .centerX)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.666_667, accuracy: 0.000_001)
        XCTAssertEqual(constraint.constant, 10.666_667, accuracy: 0.000_001)
        XCTAssertEqual(constraint.priority, UILayoutPriority(251))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}

// MARK: - Y Axis

extension AnchorConstraintsTests {
    func testEqualityForYAxisAnchor() {
        let constraint = view.topAnchor == superview.topAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForYAxisAnchor() {
        let constraint = view.bottomAnchor >= superview.bottomAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForYAxisAnchor() {
        let constraint = view.centerYAnchor <= superview.centerYAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .centerY)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForYAxisAttribute() {
        let constraint = view.firstBaselineAnchor == superview.lastBaselineAnchor ~ .defaultHigh
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .firstBaseline)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .lastBaseline)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .defaultHigh)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForYAxisAttribute() {
        let constraint = view.topAnchor >= superview.bottomAnchor + 8 ~ 750
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority, .defaultHigh)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForYAxisAttribute() {
        let constraint = view.centerYAnchor <= superview.bottomAnchor - 16 ~ .defaultHigh - 1
        XCTAssertIdentical(constraint.firstItem, superview)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .centerY)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority, UILayoutPriority(749))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}

// MARK: - Dimension

extension AnchorConstraintsTests {
    func testEqualityForDimensionAnchor() {
        let constraint = view.widthAnchor == superview.heightAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForDimensionAnchor() {
        let constraint = view.heightAnchor >= superview.widthAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForDimensionAnchor() {
        let constraint = view.heightAnchor <= superview.heightAnchor
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForDimensionValue() {
        let constraint = view.widthAnchor == 375
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 375)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForDimensionValueWithPriority() {
        let constraint = view.heightAnchor == 320 ~ 998
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority, UILayoutPriority(998))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForDimensionValue() {
        let constraint = view.widthAnchor >= 100
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForDimensionValueWithPriority() {
        let constraint = view.widthAnchor >= 100 ~ 500
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.priority, UILayoutPriority(500))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForDimensionValue() {
        let constraint = view.heightAnchor <= 320
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForDimensionValueWithPriority() {
        let constraint = view.heightAnchor <= 320 ~ .required - 400
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority, UILayoutPriority(600))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForDimensionAttribute() {
        let constraint = view.heightAnchor == 2 * superview.heightAnchor - 8 ~ 400
        XCTAssertIdentical(constraint.firstItem, superview)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertEqual(constraint.priority, UILayoutPriority(400))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForDimensionAttribute() {
        let constraint = view.heightAnchor >= superview.heightAnchor * 1.25 - 8 ~ 400
        XCTAssertIdentical(constraint.firstItem, superview)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 0.8, accuracy: 0.0001)
        XCTAssertEqual(constraint.constant, 6.4)
        XCTAssertEqual(constraint.priority, UILayoutPriority(400))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForDimensionAttribute() {
        let constraint = view.widthAnchor <= superview.heightAnchor / 2 + 48 ~ 999
        XCTAssertIdentical(constraint.firstItem, view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 48)
        XCTAssertEqual(constraint.priority, UILayoutPriority(999))
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}
