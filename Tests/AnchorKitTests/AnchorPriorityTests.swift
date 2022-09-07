//
//  AnchorPriorityTests.swift
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

class AnchorPriorityTests: XCTestCase {
    private var view: UIView!

    override func setUp() {
        super.setUp()

        view = UIView()
    }

    override func tearDown() {
        view = nil

        super.tearDown()
    }
}

// MARK: - X Axis Anchor

extension AnchorPriorityTests {
    func testXAxisAnchorWithLayoutPriority() {
        let attribute = view.trailingAnchor ~ .defaultHigh
        XCTAssertIdentical(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testXAxisAnchorWithFloatPriority() {
        let attribute = view.leadingAnchor ~ 700
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(700))
    }

    func testXAxisAttributeWithLayoutPriority() {
        let attribute = 2 * view.leftAnchor + 8 ~ .defaultLow - 1
        XCTAssertIdentical(attribute.anchor, view.leftAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, UILayoutPriority(249))
    }

    func testXAxisAttributeWithFloatPriority() {
        let attribute = view.centerXAnchor - 16 ~ 1
        XCTAssertIdentical(attribute.anchor, view.centerXAnchor)
        XCTAssertEqual(attribute.constant, -16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(1))
    }
}

// MARK: - Y Axis Anchor

extension AnchorPriorityTests {
    func testYAxisAnchorWithLayoutPriority() {
        let attribute = view.bottomAnchor ~ .defaultLow
        XCTAssertIdentical(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testYAxisAnchorWithFloatPriority() {
        let attribute = view.topAnchor ~ 255
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(255))
    }

    func testYAxisAttributeWithLayoutPriority() {
        let attribute = view.centerYAnchor - 44 ~ .defaultHigh
        XCTAssertIdentical(attribute.anchor, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, -44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testYAxisAttributeWithFloatPriority() {
        let attribute = view.lastBaselineAnchor / 2 ~ 800
        XCTAssertIdentical(attribute.anchor, view.lastBaselineAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }
}

// MARK: - Dimension Anchor

extension AnchorPriorityTests {
    func testDimensionAnchorWithLayoutPriority() {
        let attribute = view.heightAnchor ~ .fittingSizeLevel
        XCTAssertIdentical(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testDimensionAnchorWithFloatPriority() {
        let attribute = view.widthAnchor ~ 999
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(999))
    }

    func testDimensionAttributeWithLayoutPriority() {
        let attribute = 2 * view.widthAnchor ~ .required
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributeWithFloatPriority() {
        let attribute = view.heightAnchor * 3 / 2 ~ 999
        XCTAssertIdentical(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(999))
    }

    func testDimensionValueWithLayoutPriority() {
        let attribute: AnchorAttribute = 375 ~ .defaultHigh + 1
        XCTAssertTrue(attribute.anchor is LayoutDimension)
        XCTAssertEqual(attribute.constant, 375)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testDimensionValueWithFloatPriority() {
        let attribute: AnchorAttribute = 100 ~ 252
        XCTAssertTrue(attribute.anchor is LayoutDimension)
        XCTAssertEqual(attribute.constant, 100)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(252))
    }
}

// MARK: - System Spacing

extension AnchorPriorityTests {
    func testXAxisAnchorWithSystemSpacingAndLayoutPriority() {
        let attribute = view.leadingAnchor + .systemSpacing ~ .required
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testXAxisAnchorWithSystemSpacingAndFloatPriority() {
        let attribute = view.centerXAnchor + 2 * .systemSpacing ~ 999
        XCTAssertIdentical(attribute.anchor, view.centerXAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 2)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, UILayoutPriority(999))
    }

    func testYAxisAnchorWithSystemSpacingAndLayoutPriority() {
        let attribute = view.topAnchor + .systemSpacing / 2 ~ .defaultLow
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 0.5)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testYAxisAnchorWithSystemSpacingAndFloatPriority() {
        let attribute = view.bottomAnchor + .systemSpacing ~ 751
        XCTAssertIdentical(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }
}
