//
//  SizePairAttributeTests.swift
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

class SizePairAttributeTests: XCTestCase {
    private var view: UIView!
    private var superview: UIView!

    private var sizeAttribute: PairAttribute<SizePair>!

    override func setUp() {
        super.setUp()

        view = UIView()
        superview = UIView()
        superview.addSubview(view)

        sizeAttribute = PairAttribute(
            anchor: view.sizeAnchors,
            constant: PairConstant(first: 240, second: 124),
            multiplier: 1.25,
            priority: .defaultHigh + 1
        )
    }

    override func tearDown() {
        view = nil
        superview = nil

        super.tearDown()
    }
}

extension SizePairAttributeTests {
    func testSizeAnchorsPlusPoint() {
        let attribute = view.sizeAnchors + CGSize(width: 16, height: 16)
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 16)
        XCTAssertEqual(attribute.constant.second, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAnchorsPlusValue() {
        let attribute = view.sizeAnchors + 24
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 24)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAnchorsMinusPoint() {
        let attribute = view.sizeAnchors - CGSize(width: 44, height: 88)
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, -44)
        XCTAssertEqual(attribute.constant.second, -88)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAnchorsMinusValue() {
        let attribute = view.sizeAnchors - 44
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, -44)
        XCTAssertEqual(attribute.constant.second, -44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAnchorsMultiplyByValue() {
        let attribute = view.sizeAnchors * 2
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testValueMultiplyBySizeAnchors() {
        let attribute = 0.5 * view.sizeAnchors
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAnchorsDivideByValue() {
        let attribute = view.sizeAnchors / 2
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 0)
        XCTAssertEqual(attribute.constant.second, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testSizeAttributePlusPoint() {
        let attribute = sizeAttribute + CGSize(width: 64, height: 12)
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 304)
        XCTAssertEqual(attribute.constant.second, 136)
        XCTAssertEqual(attribute.multiplier, 1.25)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeAttributePlusValue() {
        let attribute = sizeAttribute + 44
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 284)
        XCTAssertEqual(attribute.constant.second, 168)
        XCTAssertEqual(attribute.multiplier, 1.25)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeAttributeMinusPoint() {
        let attribute = sizeAttribute - CGSize(width: 32, height: 16)
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 208)
        XCTAssertEqual(attribute.constant.second, 108)
        XCTAssertEqual(attribute.multiplier, 1.25)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeAttributeMinusValue() {
        let attribute = sizeAttribute - 100
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 140)
        XCTAssertEqual(attribute.constant.second, 24)
        XCTAssertEqual(attribute.multiplier, 1.25)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeAttributeMiltiplyByValue() {
        let attribute = sizeAttribute * 2
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 240)
        XCTAssertEqual(attribute.constant.second, 124)
        XCTAssertEqual(attribute.multiplier, 2.5)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }

    func testSizeAttributeDivideByValue() {
        let attribute = sizeAttribute / 3
        XCTAssertIdentical(attribute.anchor.first, view.widthAnchor)
        XCTAssertIdentical(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant.first, 240)
        XCTAssertEqual(attribute.constant.second, 124)
        XCTAssertEqual(attribute.multiplier, 0.417, accuracy: 0.001)
        XCTAssertEqual(attribute.priority, UILayoutPriority(751))
    }
}
