//
//  AnchorAttributeTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 27/09/2018.
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

class AnchorKitTests: XCTestCase {
    private var view: UIView!

    private var xAxisAttribute: AnchorAttribute<NSLayoutXAxisAnchor>!
    private var yAxisAttribute: AnchorAttribute<NSLayoutYAxisAnchor>!
    private var dimensionAttribute: AnchorAttribute<NSLayoutDimension>!

    override func setUp() {
        super.setUp()

        view = UIView()
        xAxisAttribute = Attribute(
            anchor: view.leadingAnchor,
            constant: 8,
            multiplier: 1,
            priority: .fittingSizeLevel
        )
        yAxisAttribute = Attribute(
            anchor: view.topAnchor,
            constant: -32,
            multiplier: 1.5,
            priority: .defaultHigh
        )
        dimensionAttribute = Attribute(
            anchor: view.widthAnchor,
            constant: 64,
            multiplier: 2,
            priority: UILayoutPriority(251)
        )
    }

    override func tearDown() {
        view = nil
        xAxisAttribute = nil
        yAxisAttribute = nil
        dimensionAttribute = nil

        super.tearDown()
    }
}

// MARK: - X Axis

extension AnchorKitTests {
    func testXAxisAnchorPlusNumber() {
        let attribute = view.leadingAnchor + 8.5
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8.5)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testXAxisAnchorMinusNumber() {
        let attribute = view.trailingAnchor - 8
        XCTAssertIdentical(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, -8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testXAxisAnchorMultipleByNumber() {
        let attribute = view.centerXAnchor * 2
        XCTAssertIdentical(attribute.anchor, view.centerXAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testNumberMultipleByXAxisAnchor() {
        let attribute = 1.125 * view.leftAnchor
        XCTAssertIdentical(attribute.anchor, view.leftAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1.125)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testXAxisAnchorDivideByNumber() {
        let attribute = view.rightAnchor / 2
        XCTAssertIdentical(attribute.anchor, view.rightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testXAxisAttributePlusNumber() {
        let attribute = xAxisAttribute + 8
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testXAxisAttributeMinusNumber() {
        let attribute = xAxisAttribute - 24.3
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, -16.3)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testXAxisAttributeMultipleByNumber() {
        let attribute = xAxisAttribute * 2
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }

    func testXAxisAttributeDivideByNumber() {
        let attribute = xAxisAttribute / 4
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .fittingSizeLevel)
    }
}

// MARK: - Y Axis

extension AnchorKitTests {
    func testYAxisAnchorPlusNumber() {
        let attribute = view.topAnchor + 16
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testYAxisAnchorMinusNumber() {
        let attribute = view.bottomAnchor - 32.5
        XCTAssertIdentical(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, -32.5)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testYAxisAnchorMultipleByNumber() {
        let attribute = view.centerYAnchor * 4.3
        XCTAssertIdentical(attribute.anchor, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 4.3)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testNumberMultipleByWithYAxisAnchor() {
        let attribute = 2 * view.firstBaselineAnchor
        XCTAssertIdentical(attribute.anchor, view.firstBaselineAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testYAxisAnchorDivideByNumber() {
        let attribute = view.lastBaselineAnchor / 4
        XCTAssertIdentical(attribute.anchor, view.lastBaselineAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testYAxisAttributePlusNumber() {
        let attribute = yAxisAttribute + 16.5
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -15.5)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testYAxisAttributeMinusNumber() {
        let attribute = yAxisAttribute - 8
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -40)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testYAxisAttributeMultipleByNumber() {
        let attribute = yAxisAttribute * 4.1
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -32)
        XCTAssertEqual(attribute.multiplier, 6.15, accuracy: 0.01)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }

    func testYAxisAttributeDivideByNumber() {
        let attribute = yAxisAttribute / 8
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -32)
        XCTAssertEqual(attribute.multiplier, 0.1875)
        XCTAssertEqual(attribute.priority, .defaultHigh)
    }
}

// MARK: - Dimension

extension AnchorKitTests {
    func testDimesionAnchorPlusNumber() {
        let attribute = view.widthAnchor + 24
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAnchorMinusNumber() {
        let attribute = view.heightAnchor - 12.5
        XCTAssertIdentical(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, -12.5)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAnchorMultipleByNumber() {
        let attribute = view.widthAnchor * 8
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 8)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testNumberMultipleByWithDimensionAnchor() {
        let attribute = 4.9 * view.heightAnchor
        XCTAssertIdentical(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 4.9)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAnchorDivideByNumber() {
        let attribute = view.heightAnchor / 8
        XCTAssertIdentical(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.125)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributePlusNumber() {
        let attribute = dimensionAttribute + 32
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 96)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, UILayoutPriority(251))
    }

    func testDimensionAttributeMinusNumber() {
        let attribute = dimensionAttribute - 16.1
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 47.9)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, UILayoutPriority(251))
    }

    func testDimensionAttributeMultipleByNumber() {
        let attribute = dimensionAttribute * 8.2
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 64)
        XCTAssertEqual(attribute.multiplier, 16.4)
        XCTAssertEqual(attribute.priority, UILayoutPriority(251))
    }

    func testDimensionAttributeDivideByNumber() {
        let attribute = dimensionAttribute / 2
        XCTAssertIdentical(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 64)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, UILayoutPriority(251))
    }
}
