//
//  SizePairConstraintsTests.swift
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

class SizePairConstraintsTests: XCTestCase {
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

extension SizePairConstraintsTests {
    func testEqualityForSizeAnchors() {
        let constraints = view.sizeAnchors == superview.sizeAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSizeAnchors() {
        let constraints = view.sizeAnchors >= superview.sizeAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSizeAnchors() {
        let constraints = view.sizeAnchors <= superview.sizeAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForSize() {
        let constraints = view.sizeAnchors == CGSize(width: 60, height: 120)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 60)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 120)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForSizeWithPriority() {
        let constraints = view.sizeAnchors == CGSize(width: 60, height: 120) ~ .defaultLow
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 60)
        XCTAssertEqual(constraints[0].priority, .defaultLow)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 120)
        XCTAssertEqual(constraints[1].priority, .defaultLow)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSize() {
        let constraints = view.sizeAnchors >= .zero
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSizeWithPriority() {
        let constraints = view.sizeAnchors >= CGSize(width: 124, height: 96) ~ 125
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 124)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(125))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 96)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(125))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSize() {
        let constraints = view.sizeAnchors <= CGSize(width: 24, height: 24)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 24)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 24)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSizeWithPriority() {
        let constraints = view.sizeAnchors <= CGSize(width: 100, height: 100) ~ 999
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 100)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(999))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 100)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(999))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForSizeValue() {
        let constraints = view.sizeAnchors == 50
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 50)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 50)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForSizeValueWithPriority() {
        let constraints = view.sizeAnchors == 50 ~ .fittingSizeLevel + 5
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 50)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(55))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 50)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(55))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSizeValue() {
        let constraints = view.sizeAnchors >= 24
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 24)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 24)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSizeValueWithPriority() {
        let constraints = view.sizeAnchors >= 88 ~ .defaultLow
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 88)
        XCTAssertEqual(constraints[0].priority, .defaultLow)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 88)
        XCTAssertEqual(constraints[1].priority, .defaultLow)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSizeValue() {
        let constraints = view.sizeAnchors <= 100
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 100)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 100)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSizeValueWithPriority() {
        let constraints = view.sizeAnchors <= 50 ~ 800
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[0].secondItem)
        XCTAssertEqual(constraints[0].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 50)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(800))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertNil(constraints[1].secondItem)
        XCTAssertEqual(constraints[1].secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 50)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(800))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForSizeAttribute() {
        let constraints = view.sizeAnchors == 2 * superview.sizeAnchors - 8 ~ 999
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 2)
        XCTAssertEqual(constraints[0].constant, -8)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(999))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 2)
        XCTAssertEqual(constraints[1].constant, -8)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(999))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForSizeAttribute() {
        let constraints = view.sizeAnchors >= superview.sizeAnchors + CGSize(width: 75, height: 24)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 75)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 24)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForSizeAttribute() {
        let constraints = view.sizeAnchors <= superview.sizeAnchors ~ .defaultLow
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .width)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .width)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .defaultLow)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .height)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .height)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .defaultLow)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }
}
