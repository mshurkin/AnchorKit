//
//  CenterPairConstraintsTests.swift
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

class CenterPairConstraintsTests: XCTestCase {
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

extension CenterPairConstraintsTests {
    func testEqualityForCenterAnchors() {
        let constraints = view.centerAnchors == superview.centerAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForCenterAnchors() {
        let constraints = view.centerAnchors >= superview.centerAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForCenterAnchors() {
        let constraints = view.centerAnchors <= superview.centerAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForCenterAttribute() {
        let constraints = view.centerAnchors == superview.centerAnchors + 24
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 24)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 24)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForCenterAttribute() {
        let constraints = view.centerAnchors >= superview.centerAnchors ~ .defaultHigh
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .defaultHigh)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .defaultHigh)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForCenterAttribute() {
        let constraints = view.centerAnchors <= superview.centerAnchors - CGPoint(x: 16, y: 24)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .centerX)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .centerX)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, -16)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .centerY)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .centerY)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, -24)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }
}
