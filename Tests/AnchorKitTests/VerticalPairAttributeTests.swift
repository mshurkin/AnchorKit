//
//  VerticalPairAttributeTests.swift
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

class VerticalPairAttributeTests: XCTestCase {
    private var view: UIView!
    private var superview: UIView!

    private var verticalAttribute: PairAttribute<VerticalPair>!

    override func setUp() {
        super.setUp()

        view = UIView()
        superview = UIView()
        superview.addSubview(view)

        verticalAttribute = PairAttribute(
            anchor: view.verticalAnchors,
            constant: PairConstant(first: 88.5, second: 34),
            multiplier: 0.5,
            priority: UILayoutPriority(800)
        )
    }

    override func tearDown() {
        view = nil
        superview = nil

        super.tearDown()
    }
}

extension VerticalPairAttributeTests {
    func testVerticalAnchorsPlusInsets() {
        let attribute = view.verticalAnchors + UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsPlusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.verticalAnchors + NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 24, trailing: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 12)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsPlusValue() {
        let attribute = view.verticalAnchors + 16
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsMinusInsets() {
        let attribute = view.verticalAnchors - UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, -6)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsMinusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = view.verticalAnchors - NSDirectionalEdgeInsets(top: 88, leading: 0, bottom: 34, trailing: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, -88)
        XCTAssertEqual(attribute.constant.second, -34)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsMinusValue() {
        let attribute = view.verticalAnchors - 32
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, -32)
        XCTAssertEqual(attribute.constant.second, -32)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsMultiplyByValue() {
        let attribute = view.verticalAnchors * 2
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testValueMultiplyByVerticalAnchors() {
        let attribute = 1.5 * view.verticalAnchors
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorsDivideByValue() {
        let attribute = view.verticalAnchors / 4
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAttributePlusInsets() {
        let attribute = verticalAttribute + UIEdgeInsets(top: 12, left: 0, bottom: 6, right: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 100.5)
        XCTAssertEqual(attribute.constant.second, 40)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributePlusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = verticalAttribute + NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 34.5, trailing: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 88.5)
        XCTAssertEqual(attribute.constant.second, 68.5)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributePlusValue() {
        let attribute = verticalAttribute + 2
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 90.5)
        XCTAssertEqual(attribute.constant.second, 36)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributeMinusInsets() {
        let attribute = verticalAttribute - UIEdgeInsets(top: 89, left: 0, bottom: 34, right: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, -0.5)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributeMinusDirectionalInsets() {
        // swiftlint:disable:next line_length
        let attribute = verticalAttribute - NSDirectionalEdgeInsets(top: 18.5, leading: 0, bottom: 14, trailing: 0)
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 70)
        XCTAssertEqual(attribute.constant.second, 20)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributeMinusValue() {
        let attribute = verticalAttribute - 60
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 28.5)
        XCTAssertEqual(attribute.constant.second, -26)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributeMiltiplyByValue() {
        let attribute = verticalAttribute * 3
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 88.5)
        XCTAssertEqual(attribute.constant.second, 34)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }

    func testVerticalAttributeDivideByValue() {
        let attribute = verticalAttribute / 0.5
        XCTAssertIdentical(attribute.anchor.first, view.topAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.first, 88.5)
        XCTAssertEqual(attribute.constant.second, 34)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(800))
    }
}
