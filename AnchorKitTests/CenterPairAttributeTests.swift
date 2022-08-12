//
//  CenterPairAttributeTests.swift
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

class CenterPairAttributeTests: XCTestCase {
    private var view: UIView!
    private var superview: UIView!

    private var centerAttribute: PairAttribute<CenterPair>!

    override func setUp() {
        super.setUp()

        view = UIView()
        superview = UIView()
        superview.addSubview(view)

        centerAttribute = PairAttribute(
            anchor: view.centerAnchors,
            constant: PairConstant(first: 16, second: -16),
            multiplier: 1,
            priority: .required
        )
    }

    override func tearDown() {
        view = nil
        superview = nil

        super.tearDown()
    }
}

extension CenterPairAttributeTests {
    func testCenterAnchorsPlusPoint() {
        let attribute = view.centerAnchors + CGPoint(x: 16, y: 60)
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 60)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAnchorsPlusValue() {
        let attribute = view.centerAnchors + 8
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 8)
        XCTAssertEqual(attribute.constant.second, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAnchorsMinusPoint() {
        let attribute = view.centerAnchors - CGPoint(x: 8, y: 12)
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, -8)
        XCTAssertEqual(attribute.constant.second, -12)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAnchorsMinusValue() {
        let attribute = view.centerAnchors - 4
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, -4)
        XCTAssertEqual(attribute.constant.second, -4)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAnchorsMultiplyByValue() {
        let attribute = view.centerAnchors * 0.25
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testValueMultiplyByCenterAnchors() {
        let attribute = 4 * view.centerAnchors
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAnchorsDivideByValue() {
        let attribute = view.centerAnchors / 0.5
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributePlusPoint() {
        let attribute = centerAttribute + CGPoint(x: 100, y: 100)
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 116)
        XCTAssertEqual(attribute.constant.second, 84)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributePlusValue() {
        let attribute = centerAttribute + 16
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 32)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributeMinusPoint() {
        let attribute = centerAttribute - CGPoint(x: 0, y: 4)
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, -20)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributeMinusValue() {
        let attribute = centerAttribute - 100
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, -84)
        XCTAssertEqual(attribute.constant.second, -116)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributeMiltiplyByValue() {
        let attribute = centerAttribute * 2
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, -16)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testCenterAttributeDivideByValue() {
        let attribute = centerAttribute / 3
        XCTAssertIdentical(attribute.anchor.first, view.centerXAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, -16)
        XCTAssertEqual(attribute.multiplier, 0.3333, accuracy: 0.0001)
        XCTAssertEqual(attribute.priority, .required)
    }
}
