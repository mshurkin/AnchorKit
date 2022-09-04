//
//  SpacingTests.swift
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

class SpacingTests: XCTestCase {
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

extension SpacingTests {
    func testSystemSpacingMultipleByNumber() {
        let spacing = LayoutSpacing.systemSpacing * 3
        XCTAssertEqual(spacing.multiplier, 3)
    }

    func testNumberMultipleBySystemSpacing() {
        let spacing = 0.5 * LayoutSpacing.systemSpacing
        XCTAssertEqual(spacing.multiplier, 0.5)
    }

    func testSystemSpacingDivideByNumber() {
        let spacing = LayoutSpacing.systemSpacing / 10
        XCTAssertEqual(spacing.multiplier, 0.1)
    }

    func testXAxisAnchorWithSystemSpacing() {
        let attribute = view.leadingAnchor + .systemSpacing
        XCTAssertIdentical(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testYAxisAnchorWithSystemSpacing() {
        let attribute = view.topAnchor + .systemSpacing * 2
        XCTAssertIdentical(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 2)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }
}
