//
//  PairPriorityTests.swift
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

class PairPriorityTests: XCTestCase {
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

// MARK: - Horizontal Anchors

extension PairPriorityTests {
    func testHorizontalAnchorsWithLayoutPriority() {
        let attribute = view.horizontalAnchors ~ .defaultLow
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testHorizontalAnchorsWithFloatPriority() {
        let attribute = view.horizontalAnchors ~ 252
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(252))
    }

    func testHorizontalAbsoluteAnchorsWithLayoutPriority() {
        let attribute = view.horizontalAnchors(.absolute) ~ .defaultHigh
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testHorizontalAbsoluteAnchorsWithFloatPriority() {
        let attribute = view.horizontalAnchors(.absolute) ~ 749
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(749))
    }

    func testHorizontalAttributeWithLayoutPriority() {
        let attribute = view.horizontalAnchors + 15 ~ .required
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 15)
        XCTAssertEqual(attribute.constant.second, 15)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributeWithFloatPriority() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors - UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 6) ~ 656
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, -10)
        XCTAssertEqual(attribute.constant.second, -6)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(656))
    }
}

// MARK: - Vertical Anchors

extension PairPriorityTests {
    func testVerticalAnchorsWithLayoutPriority() {
        let attribute = view.verticalAnchors ~ .fittingSizeLevel
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testVerticalAnchorsWithFloatPriority() {
        let attribute = view.verticalAnchors ~ 1
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(1))
    }

    func testVerticalAttributeWithLayoutPriority() {
        let attribute = view.verticalAnchors + 1 ~ .defaultHigh - 1
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 1)
        XCTAssertEqual(attribute.constant.second, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(749))
    }

    func testVerticalAttributeWithFloatPriority() {
        // swiftlint:disable:next line_length
        let attribute = view.verticalAnchors - UIEdgeInsets(top: 44, left: 0, bottom: 37, right: 0) ~ 998
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, -44)
        XCTAssertEqual(attribute.constant.second, -37)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(998))
    }
}

// MARK: - Center Anchors

extension PairPriorityTests {
    func testCenterAnchorsWithLayoutPriority() {
        let attribute = view.centerAnchors ~ .defaultHigh
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testCenterAnchorsWithFloatPriority() {
        let attribute = view.centerAnchors ~ 222
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(222))
    }

    func testCenterAttributeWithLayoutPriority() {
        let attribute = view.centerAnchors + CGPoint(x: 0, y: 15) ~ .required
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 15)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributeWithFloatPriority() {
        let attribute = view.centerAnchors + 10 ~ 760
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 10)
        XCTAssertEqual(attribute.constant.second, 10)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(760))
    }
}

// MARK: - Size Anchors

extension PairPriorityTests {
    func testSizeAnchorsWithLayoutPriority() {
        let attribute = view.sizeAnchors ~ .fittingSizeLevel
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testSizeAnchorsWithFloatPriority() {
        let attribute = view.sizeAnchors ~ 51
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(51))
    }

    func testSizeAttributeWithLayoutPriority() {
        let attribute = view.sizeAnchors + 24 ~ .defaultLow - 2
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 24)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(248))
    }

    func testSizeAttributeWithFloatPriority() {
        let attribute = view.sizeAnchors / 2 + CGSize(width: 2, height: 16) ~ 1000
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 2)
        XCTAssertEqual(attribute.constant.second, 16)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeWithLayoutPriority() {
        let attribute = CGSize(width: 15, height: 4) ~ .defaultLow
        XCTAssertTrue(attribute.anchor.first is LayoutDimension)
        XCTAssertTrue(attribute.anchor.second is LayoutDimension)
        XCTAssertEqual(attribute.constant.first, 15)
        XCTAssertEqual(attribute.constant.second, 4)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testSizeWithFloatPriority() {
        let attribute = CGSize(width: 50, height: 24) ~ 751
        XCTAssertTrue(attribute.anchor.first is LayoutDimension)
        XCTAssertTrue(attribute.anchor.second is LayoutDimension)
        XCTAssertEqual(attribute.constant.first, 50)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeNumberWithLayoutPriority() {
        let attribute: PairAttribute<SizePair> = 24 ~ .required
        XCTAssertTrue(attribute.anchor.first is LayoutDimension)
        XCTAssertTrue(attribute.anchor.second is LayoutDimension)
        XCTAssertEqual(attribute.constant.first, 24)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeNumberWithFloatPriority() {
        let attribute: PairAttribute<SizePair> = 36 ~ 750
        XCTAssertTrue(attribute.anchor.first is LayoutDimension)
        XCTAssertTrue(attribute.anchor.second is LayoutDimension)
        XCTAssertEqual(attribute.constant.first, 36)
        XCTAssertEqual(attribute.constant.second, 36)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }
}
