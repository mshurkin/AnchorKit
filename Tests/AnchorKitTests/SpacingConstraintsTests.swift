//
//  SpacingConstraintsTests.swift
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

class SpacingConstraintsTests: XCTestCase {
    private var superview: UIView!
    private var view: UIView!
    private var label: UILabel!

    override func setUp() {
        super.setUp()

        view = UIView()
        label = UILabel()
        superview = UIView()
        superview.addSubview(view)
        superview.addSubview(label)
    }

    override func tearDown() {
        view = nil
        label = nil
        superview = nil

        super.tearDown()
    }
}

extension SpacingConstraintsTests {
    func testEqualityForXAxisAnchorWithSystemSpacing() {
        let constraint = label.trailingAnchor == view.trailingAnchor + .systemSpacing
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForXAxisAnchorWithSystemSpacing() {
        // swiftlint:disable:next line_length
        let constraint = label.leadingAnchor >= view.leadingAnchor + .systemSpacing * 2 ~ .defaultLow
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority, .defaultLow)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForXAxisAnchorWithSystemSpacing() {
        let constraint = label.leadingAnchor <= view.trailingAnchor + .systemSpacing / 2
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForYAxisAnchorWithSystemSpacing() {
        let constraint = label.topAnchor == view.topAnchor + .systemSpacing
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForYAxisAnchorWithSystemSpacing() {
        let constraint = label.topAnchor >= view.topAnchor + .systemSpacing * 2
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority, .required)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForYAxisAnchorWithSystemSpacing() {
        let constraint = label.bottomAnchor <= view.bottomAnchor + .systemSpacing / 2 ~ 256
        XCTAssertIdentical(constraint.firstItem, label)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertIdentical(constraint.secondItem, view)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertEqual(constraint.priority, UILayoutPriority(256))
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}
