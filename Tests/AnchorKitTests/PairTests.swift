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

@testable import AnchorKit
import XCTest

class PairTests: XCTestCase {
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

extension PairTests {
    func testViewHorizontalPair() {
        let pair = view.horizontalAnchors
        XCTAssertIdentical(pair.first, view.leadingAnchor)
        XCTAssertIdentical(pair.second, view.trailingAnchor)
    }

    func testViewHorizontalAbsolutePair() {
        let pair = view.horizontalAnchors(.absolute)
        XCTAssertIdentical(pair.first, view.leftAnchor)
        XCTAssertIdentical(pair.second, view.rightAnchor)
    }

    func testViewVerticalPair() {
        let pair = view.verticalAnchors
        XCTAssertIdentical(pair.first, view.topAnchor)
        XCTAssertIdentical(pair.second, view.bottomAnchor)
    }

    func testViewCenterPair() {
        let pair = view.centerAnchors
        XCTAssertIdentical(pair.first, view.centerXAnchor)
        XCTAssertIdentical(pair.second, view.centerYAnchor)
    }

    func testViewSizePair() {
        let pair = view.sizeAnchors
        XCTAssertIdentical(pair.first, view.widthAnchor)
        XCTAssertIdentical(pair.second, view.heightAnchor)
    }

    func testLayoutGuideHorizontalPair() {
        let pair = view.safeAreaLayoutGuide.horizontalAnchors
        XCTAssertIdentical(pair.first, view.safeAreaLayoutGuide.leadingAnchor)
        XCTAssertIdentical(pair.second, view.safeAreaLayoutGuide.trailingAnchor)
    }

    func testLayoutGuideHorizontalAbsolutePair() {
        let pair = view.safeAreaLayoutGuide.horizontalAnchors(.absolute)
        XCTAssertIdentical(pair.first, view.safeAreaLayoutGuide.leftAnchor)
        XCTAssertIdentical(pair.second, view.safeAreaLayoutGuide.rightAnchor)
    }

    func testLayoutGuideVerticalPair() {
        let pair = view.safeAreaLayoutGuide.verticalAnchors
        XCTAssertIdentical(pair.first, view.safeAreaLayoutGuide.topAnchor)
        XCTAssertIdentical(pair.second, view.safeAreaLayoutGuide.bottomAnchor)
    }

    func testLayoutGuideCenterPair() {
        let pair = view.safeAreaLayoutGuide.centerAnchors
        XCTAssertIdentical(pair.first, view.safeAreaLayoutGuide.centerXAnchor)
        XCTAssertIdentical(pair.second, view.safeAreaLayoutGuide.centerYAnchor)
    }

    func testLayoutGuideSizePair() {
        let pair = view.safeAreaLayoutGuide.sizeAnchors
        XCTAssertIdentical(pair.first, view.safeAreaLayoutGuide.widthAnchor)
        XCTAssertIdentical(pair.second, view.safeAreaLayoutGuide.heightAnchor)
    }
}
