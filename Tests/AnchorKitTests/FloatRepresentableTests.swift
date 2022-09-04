//
//  FloatRepresentableTests.swift
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

class FloatRepresentableTests: XCTestCase {
    func testCastingCGFloatToCGFloat() {
        XCTAssertEqual(CGFloat(10.5).cgFloat, 10.5)
    }

    func testCastingDoubleToCGFloat() {
        XCTAssertEqual(Double(10.5).cgFloat, 10.5)
    }

    func testCastingFloatToCGFloat() {
        XCTAssertEqual(Float(10.5).cgFloat, 10.5)
    }

    func testCastingFloat80ToCGFloat() {
        XCTAssertEqual(Float80(10.5).cgFloat, 10.5)
    }

    func testCastingUIntToCGFloat() {
        XCTAssertEqual(UInt(10.5).cgFloat, 10)
    }

    func testCastingUInt8ToCGFloat() {
        XCTAssertEqual(UInt8(10.5).cgFloat, 10)
    }

    func testCastingUInt16ToCGFloat() {
        XCTAssertEqual(UInt16(10.5).cgFloat, 10)
    }

    func testCastingUInt32ToCGFloat() {
        XCTAssertEqual(UInt32(10.5).cgFloat, 10)
    }

    func testCastingUInt64ToCGFloat() {
        XCTAssertEqual(UInt64(10.5).cgFloat, 10)
    }

    func testCastingIntToCGFloat() {
        XCTAssertEqual(Int(10.5).cgFloat, 10)
    }

    func testCastingInt8ToCGFloat() {
        XCTAssertEqual(Int8(10.5).cgFloat, 10)
    }

    func testCastingInt16ToCGFloat() {
        XCTAssertEqual(Int16(10.5).cgFloat, 10)
    }

    func testCastingInt32ToCGFloat() {
        XCTAssertEqual(Int32(10.5).cgFloat, 10)
    }

    func testCastingInt64ToCGFloat() {
        XCTAssertEqual(Int64(10.5).cgFloat, 10)
    }
}
