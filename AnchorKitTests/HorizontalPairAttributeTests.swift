//
//  HorizontalPairAttributeTests.swift
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

@testable import AnchorKit
import XCTest

private typealias HPairAttribute = PairAttribute<Pair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>>

class HorizontalPairAttributeTests: XCTestCase {
    private var view: UIView!
    private var superview: UIView!

    private var horizontalAttribute: HPairAttribute!
    private var horizontalAbsoluteAttribute: HPairAttribute!

    override func setUp() {
        super.setUp()

        view = UIView()
        superview = UIView()
        superview.addSubview(view)

        horizontalAttribute = PairAttribute(
            anchor: view.horizontalAnchors.directional,
            constant: PairConstant(first: 16, second: 12),
            multiplier: 1.5,
            priority: .defaultHigh
        )
        horizontalAbsoluteAttribute = PairAttribute(
            anchor: view.horizontalAnchors.absolute,
            constant: PairConstant(first: 8, second: 0),
            multiplier: 1,
            priority: .defaultLow
        )
    }

    override func tearDown() {
        view = nil
        superview = nil

        super.tearDown()
    }
}

extension HorizontalPairAttributeTests {
    func testHorizontalAnchorsPlusInsets() {
        let attribute = view.horizontalAnchors + UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsPlusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors + NSDirectionalEdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 24)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 32)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsPlusValue() {
        let attribute = view.horizontalAnchors + 12
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 12)
        XCTAssertEqual(attribute.constant.second, 12)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsMinusInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors - UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 24)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, -12)
        XCTAssertEqual(attribute.constant.second, -24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsMinusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors - NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 4)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, -8)
        XCTAssertEqual(attribute.constant.second, -4)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsMinusValue() {
        let attribute = view.horizontalAnchors - 16
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, -16)
        XCTAssertEqual(attribute.constant.second, -16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsMultiplyByValue() {
        let attribute = view.horizontalAnchors * 2
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testValueMultiplyByHorizontalAnchors() {
        let attribute = 1.5 * view.horizontalAnchors
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAnchorsDivideByValue() {
        let attribute = view.horizontalAnchors / 2
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsPlusInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors.absolute + UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsPlusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors.absolute + NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 24)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsPlusValue() {
        let attribute = view.horizontalAnchors.absolute + 8
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 8)
        XCTAssertEqual(attribute.constant.second, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsMinusInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors.absolute - UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 6)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, -4)
        XCTAssertEqual(attribute.constant.second, -6)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsMinusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.horizontalAnchors.absolute - NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, -10)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsMinusValue() {
        let attribute = view.horizontalAnchors.absolute - 32
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, -32)
        XCTAssertEqual(attribute.constant.second, -32)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsMultiplyByValue() {
        let attribute = view.horizontalAnchors * 4
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testValueMultiplyByHorizontalAbsoluteAnchors() {
        let attribute = 2.5 * view.horizontalAnchors.absolute
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 2.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAbsoluteAnchorsDivideByValue() {
        let attribute = view.horizontalAnchors / 3
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.3333, accuracy: 0.0001)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributePlusInsets() {
        let attribute = horizontalAttribute + UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 32)
        XCTAssertEqual(attribute.constant.second, 12)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testHorizontalAttributePlusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = horizontalAbsoluteAttribute + NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 8)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 12)
        XCTAssertEqual(attribute.constant.second, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testHorizontalAttributePlusValue() {
        let attribute = horizontalAttribute + 4
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 20)
        XCTAssertEqual(attribute.constant.second, 16)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testHorizontalAttributeMinusInsets() {
        // swiftlint:disable:next line_length
        let attribute = horizontalAbsoluteAttribute - UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, -2)
        XCTAssertEqual(attribute.constant.second, -20)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testHorizontalAttributeMinusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = horizontalAttribute - NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 12)
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 10)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testHorizontalAttributeMinusValue() {
        let attribute = horizontalAbsoluteAttribute - 16
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, -8)
        XCTAssertEqual(attribute.constant.second, -16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }

    func testHorizontalAttributeMiltiplyByValue() {
        let attribute = horizontalAttribute * 1.5
        XCTAssertIdentical(attribute.anchor.first, view.leadingAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 12)
        XCTAssertEqual(attribute.multiplier, 2.25)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testHorizontalAttributeDivideByValue() {
        let attribute = horizontalAbsoluteAttribute / 2
        XCTAssertIdentical(attribute.anchor.first, view.leftAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.rightAnchor)
        XCTAssertEqual(attribute.constant.first, 8)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .defaultLow)
    }
}
