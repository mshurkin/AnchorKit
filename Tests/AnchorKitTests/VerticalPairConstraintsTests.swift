//
//  VerticalPairConstraintsTests.swift
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

class VerticalPairConstraintsTests: XCTestCase {
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

extension VerticalPairConstraintsTests {
    func testEqualityForVerticalAnchors() {
        let constraints = view.verticalAnchors == superview.verticalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForVerticalAnchors() {
        let constraints = view.verticalAnchors >= superview.verticalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForVerticalAnchors() {
        let constraints = view.verticalAnchors <= superview.verticalAnchors
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testEqualityForVerticalAttribute() {
        let constraints = view.verticalAnchors == superview.verticalAnchors ~ 124
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, view)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .equal)
        XCTAssertIdentical(constraints[0].secondItem, superview)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 0)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(124))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, superview)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .equal)
        XCTAssertIdentical(constraints[1].secondItem, view)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 0)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(124))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testGreaterThanForVerticalAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.verticalAnchors >= superview.verticalAnchors + UIEdgeInsets(top: 88, left: 0, bottom: 37, right: 0)
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1)
        XCTAssertEqual(constraints[0].constant, 88)
        XCTAssertEqual(constraints[0].priority, .required)
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1)
        XCTAssertEqual(constraints[1].constant, 37)
        XCTAssertEqual(constraints[1].priority, .required)
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }

    func testLessThanForVerticalAttribute() {
        // swiftlint:disable:next line_length
        let constraints = view.verticalAnchors <= 2 * superview.verticalAnchors / 3 - NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0) ~ .defaultHigh - 1
        XCTAssertEqual(constraints.count, 2)
        XCTAssertIdentical(constraints[0].firstItem, superview)
        XCTAssertEqual(constraints[0].firstAttribute, .top)
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual)
        XCTAssertIdentical(constraints[0].secondItem, view)
        XCTAssertEqual(constraints[0].secondAttribute, .top)
        XCTAssertEqual(constraints[0].multiplier, 1.5)
        XCTAssertEqual(constraints[0].constant, 24, accuracy: 0.1)
        XCTAssertEqual(constraints[0].priority, UILayoutPriority(749))
        XCTAssertTrue(constraints[0].isActive)
        XCTAssertIdentical(constraints[1].firstItem, view)
        XCTAssertEqual(constraints[1].firstAttribute, .bottom)
        XCTAssertEqual(constraints[1].relation, .lessThanOrEqual)
        XCTAssertIdentical(constraints[1].secondItem, superview)
        XCTAssertEqual(constraints[1].secondAttribute, .bottom)
        XCTAssertEqual(constraints[1].multiplier, 1.5)
        XCTAssertEqual(constraints[1].constant, 12, accuracy: 0.1)
        XCTAssertEqual(constraints[1].priority, UILayoutPriority(749))
        XCTAssertTrue(constraints[1].isActive)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
    }
}
