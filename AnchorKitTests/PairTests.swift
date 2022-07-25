//
//  PairTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 05/10/2018.
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

// swiftlint:disable file_length

@testable import AnchorKit
import XCTest

class PairTests: XCTestCase {

    var view: UIView!
    var superview: UIView!

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

// MARK: - Anchors

extension PairTests {

    func testViewHorizontalPair() {
        let pair = view.horizontalAnchors
        XCTAssertEqual(pair.first, view.leadingAnchor)
        XCTAssertEqual(pair.second, view.trailingAnchor)
    }

    func testViewVerticalPair() {
        let pair = view.verticalAnchors
        XCTAssertEqual(pair.first, view.topAnchor)
        XCTAssertEqual(pair.second, view.bottomAnchor)
    }

    func testViewCenterPair() {
        let pair = view.centerAnchors
        XCTAssertEqual(pair.first, view.centerXAnchor)
        XCTAssertEqual(pair.second, view.centerYAnchor)
    }

    func testViewSizePair() {
        let pair = view.sizeAnchors
        XCTAssertEqual(pair.first, view.widthAnchor)
        XCTAssertEqual(pair.second, view.heightAnchor)
    }

    func testLayoutGuideHorizontalPair() {
        let pair = view.safeAreaLayoutGuide.horizontalAnchors
        XCTAssertEqual(pair.first, view.safeAreaLayoutGuide.leadingAnchor)
        XCTAssertEqual(pair.second, view.safeAreaLayoutGuide.trailingAnchor)
    }

    func testLayoutGuideVerticalPair() {
        let pair = view.safeAreaLayoutGuide.verticalAnchors
        XCTAssertEqual(pair.first, view.safeAreaLayoutGuide.topAnchor)
        XCTAssertEqual(pair.second, view.safeAreaLayoutGuide.bottomAnchor)
    }

    func testLayoutGuideCenterPair() {
        let pair = view.safeAreaLayoutGuide.centerAnchors
        XCTAssertEqual(pair.first, view.safeAreaLayoutGuide.centerXAnchor)
        XCTAssertEqual(pair.second, view.safeAreaLayoutGuide.centerYAnchor)
    }

    func testLayoutGuideSizePair() {
        let pair = view.safeAreaLayoutGuide.sizeAnchors
        XCTAssertEqual(pair.first, view.safeAreaLayoutGuide.widthAnchor)
        XCTAssertEqual(pair.second, view.safeAreaLayoutGuide.heightAnchor)
    }
}

// MARK: - Horizontal

extension PairTests {

    func testHorizontalAnchorsWithOffset() {
        let attribute = view.horizontalAnchors + UIEdgeInsets(left: 16, right: 8)
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithHorizontalAnchors() {
        let attribute = UIEdgeInsets(left: 8, right: 16) + view.horizontalAnchors
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAnchorsWithValueOffset() {
        let attribute = view.horizontalAnchors + 16
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithHorizontalAnchors() {
        let attribute = -8 + view.horizontalAnchors
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithOffset() {
        let attribute = view.horizontalAnchors + UIEdgeInsets(left: 18, right: 18) + UIEdgeInsets(left: 6, right: -2)
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithHorizontalAttribute() {
        let attribute = UIEdgeInsets(left: 2, right: 1) + (view.horizontalAnchors + UIEdgeInsets(left: 6, right: 7))
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithValueOffset() {
        let attribute = view.horizontalAnchors + .zero + 15
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithHorizontalAttribute() {
        let attribute = 44 + (view.horizontalAnchors + UIEdgeInsets(left: 44, right: 0))
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 44, left: 88, bottom: 44, right: 44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithHorizontalOffset() {
        let attribute = view.horizontalAnchors + 24 + UIEdgeInsets(left: 0, right: 2)
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 26))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalOffsetWithValueAttribute() {
        let attribute = UIEdgeInsets(left: 12, right: 44) + (34 + view.horizontalAnchors)
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 34, left: 46, bottom: 34, right: 78))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAnchorsWithNegativeOffset() {
        let attribute = view.horizontalAnchors - .zero
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAnchorsWithNegativeValueOffset() {
        let attribute = view.horizontalAnchors - 8
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithNegativeOffset() {
        let attribute = view.horizontalAnchors + 16 - UIEdgeInsets(left: 16, right: 8)
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithNegativeValueOffset() {
        let attribute = view.horizontalAnchors - UIEdgeInsets(left: 16, right: 10) - 16
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -16, left: -32, bottom: -16, right: -26))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithNegativeHorizontalOffset() {
        let attribute = view.horizontalAnchors + 6 - .zero
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }
}

// MARK: - Vertical

extension PairTests {

    func testVerticalAnchorsWithOffset() {
        let attribute = view.verticalAnchors + UIEdgeInsets(top: 16, bottom: 16)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithVerticalAnchors() {
        let attribute = UIEdgeInsets(top: 8, bottom: 8) + view.verticalAnchors
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAnchorsWithValueOffset() {
        let attribute = view.verticalAnchors + 34
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 34, left: 34, bottom: 34, right: 34))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithVerticalAnchors() {
        let attribute = 44 + view.verticalAnchors
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 44, left: 44, bottom: 44, right: 44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAttributeWithOffset() {
        let attribute = UIEdgeInsets(top: 16, bottom: 8) + view.verticalAnchors + UIEdgeInsets(top: 0, bottom: -8)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithVerticalAttribute() {
        let attribute = UIEdgeInsets(top: 8, bottom: 8) + (view.verticalAnchors + UIEdgeInsets.zero)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAttributeWithValueOffset() {
        let attribute = view.verticalAnchors + UIEdgeInsets(top: 88, bottom: 34) + 12
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 100, left: 12, bottom: 46, right: 12))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithVerticalAttribute() {
        let attribute = 8 + (view.verticalAnchors + .zero)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithVerticalOffset() {
        let attribute = view.verticalAnchors + 2 + .zero
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalOffsetWithValueAttribute() {
        let attribute = UIEdgeInsets(top: 16, bottom: 8) + (view.verticalAnchors + 8)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 24, left: 8, bottom: 16, right: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAnchorsWithNegativeOffset() {
        let attribute = view.verticalAnchors - UIEdgeInsets(top: 2, bottom: 18)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -2, left: 0, bottom: -18, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAnchorsWithNegativeValueOffset() {
        let attribute = view.verticalAnchors - 16
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -16, left: -16, bottom: -16, right: -16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAttributeWithNegativeOffset() {
        let attribute = view.verticalAnchors + 16 - UIEdgeInsets(top: 44, bottom: 34)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -28, left: 16, bottom: -18, right: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testVerticalAttributeWithNegativeValueOffset() {
        let attribute = view.verticalAnchors + UIEdgeInsets(top: 44, bottom: 44) - 44
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: -44, bottom: 0, right: -44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithNegativeVerticalOffset() {
        let attribute = view.verticalAnchors - 1 - UIEdgeInsets(top: 11, bottom: -15)
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -12, left: -1, bottom: 14, right: -1))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }
}

// MARK: - Center

extension PairTests {

    func testCenterAnchorsWithOffset() {
        let attribute = view.centerAnchors + UIOffset(horizontal: 100, vertical: 50)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 100, vertical: 50))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithCenterAnchors() {
        let attribute = UIOffset(horizontal: 16, vertical: -16) + view.centerAnchors
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 16, vertical: -16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAnchorsWithValueOffset() {
        let attribute = view.centerAnchors + 8
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 8, vertical: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithCenterAnchors() {
        let attribute = 16 + view.centerAnchors
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 16, vertical: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAttributeWithOffset() {
        let attribute = view.centerAnchors + UIOffset(horizontal: 1, vertical: 5) + UIOffset(horizontal: 7, vertical: 3)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 8, vertical: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithCenterAttribute() {
        let attribute = UIOffset(horizontal: 8, vertical: 8) + (view.centerAnchors + UIOffset(horizontal: -8, vertical: -8))
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAttributeWithValueOffset() {
        let attribute = view.centerAnchors + .zero + 4
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 4, vertical: 4))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithCenterAttribute() {
        let attribute = 6 + (view.centerAnchors + UIOffset(horizontal: 2, vertical: 0))
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 8, vertical: 6))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithCenterOffset() {
        let attribute = view.centerAnchors + 4 + UIOffset(horizontal: 0, vertical: 6)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 4, vertical: 10))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterOffsetWithValueAttribute() {
        let attribute = UIOffset.zero + (44 + view.centerAnchors)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 44, vertical: 44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAnchorsWithNegativeOffset() {
        let attribute = view.centerAnchors - UIOffset(horizontal: 4, vertical: 6)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: -4, vertical: -6))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAnchorsWithNegativeValueOffset() {
        let attribute = view.centerAnchors - 0
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAttributeWithNegativeOffset() {
        let attribute = view.centerAnchors - 2 - .zero
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: -2, vertical: -2))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAttributeWithNegativeValueOffset() {
        let attribute = view.centerAnchors - UIOffset(horizontal: 44, vertical: 44) - 34
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: -78, vertical: -78))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithNegativeCenterOffset() {
        let attribute = view.centerAnchors + 0 - UIOffset(horizontal: 6, vertical: 34)
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: -6, vertical: -34))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }
}

// MARK: - Size

extension PairTests {

    func testSizeAnchorsWithOffset() {
        let attribute = view.sizeAnchors + CGSize(width: 16, height: 16)
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 16, height: 16))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithSizeAnchors() {
        let attribute = CGSize(width: 24, height: 8) + view.sizeAnchors
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 24, height: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAnchorsWithValueOffset() {
        let attribute = view.sizeAnchors + 24
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 24, height: 24))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithSizeAnchors() {
        let attribute = 88 + view.sizeAnchors
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 88, height: 88))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithOffset() {
        let attribute = view.sizeAnchors + CGSize.zero + CGSize(width: 2, height: 4)
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 2, height: 4))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testOffsetWithSizeAttribute() {
        let attribute = CGSize(width: 8, height: 16) + (view.sizeAnchors + CGSize(width: -8, height: -8))
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 0, height: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithValueOffset() {
        let attribute = view.sizeAnchors + CGSize(width: 1, height: 10) + 1
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 2, height: 11))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueOffsetWithSizeAttribute() {
        let attribute = 72 + (view.sizeAnchors + CGSize(width: 8, height: 8))
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 80, height: 80))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithSizeOffset() {
        let attribute = view.sizeAnchors + 44 + .zero
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 44, height: 44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeOffsetWithValueAttribute() {
        let attribute = CGSize(width: 24, height: 32) + (view.sizeAnchors + 1)
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 25, height: 33))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAnchorsWithNegativeOffset() {
        let attribute = view.sizeAnchors - CGSize(width: 44, height: 88)
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: -44, height: -88))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAnchorsWithNegativeValueOffset() {
        let attribute = view.sizeAnchors - 44
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: -44, height: -44))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithNegativeOffset() {
        let attribute = view.sizeAnchors - 8 - CGSize(width: 8, height: -16)
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: -16, height: 8))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithNegativeValueOffset() {
        let attribute = view.sizeAnchors - CGSize(width: 8, height: 12) - 8
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: -16, height: -20))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testValueAttributeWithNegativeSizeOffset() {
        let attribute = view.sizeAnchors - 0 - .zero
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAnchorsWithMultiplier() {
        let attribute = view.sizeAnchors * 2
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testMultiplierWithSizeAnchors() {
        let attribute = 0.5 * view.sizeAnchors
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithMultiplier() {
        let attribute = (view.sizeAnchors + 24) * 3
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 24, height: 24))
        XCTAssertEqual(attribute.multiplier, 3)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testMultiplierWithSizeAttribute() {
        let attribute = 2 * (view.sizeAnchors * 3 + CGSize(width: 6, height: 4))
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 6, height: 4))
        XCTAssertEqual(attribute.multiplier, 6)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAnchorsWithDivider() {
        let attribute = view.sizeAnchors / 2
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeAttributeWithDivider() {
        let attribute = (2 + view.sizeAnchors) / 4
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 2, height: 2))
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }
}
