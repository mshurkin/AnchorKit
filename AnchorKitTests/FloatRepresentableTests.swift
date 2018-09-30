//
//  FloatRepresentableTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

import XCTest

class FloatRepresentableTests: XCTestCase {

    func testTypeCasting() {
        XCTAssertEqual(CGFloat(10.5).cgFloat, 10.5)
        XCTAssertEqual(CGFloat(5.5).float, 5.5)

        XCTAssertEqual(Double(10.5).cgFloat, 10.5)
        XCTAssertEqual(Double(5.5).float, 5.5)

        XCTAssertEqual(Float(10.5).cgFloat, 10.5)
        XCTAssertEqual(Float(5.5).float, 5.5)

        XCTAssertEqual(Float80(10.5).cgFloat, 10.5)
        XCTAssertEqual(Float80(5.5).float, 5.5)

        XCTAssertEqual(UInt(10.5).cgFloat, 10)
        XCTAssertEqual(UInt(5.5).float, 5)

        XCTAssertEqual(UInt8(10.5).cgFloat, 10)
        XCTAssertEqual(UInt8(5.5).float, 5)

        XCTAssertEqual(UInt16(10.5).cgFloat, 10)
        XCTAssertEqual(UInt16(5.5).float, 5)

        XCTAssertEqual(UInt32(10.5).cgFloat, 10)
        XCTAssertEqual(UInt32(5.5).float, 5)

        XCTAssertEqual(UInt64(10.5).cgFloat, 10)
        XCTAssertEqual(UInt64(5.5).float, 5)

        XCTAssertEqual(Int(10.5).cgFloat, 10)
        XCTAssertEqual(Int(5.5).float, 5)

        XCTAssertEqual(Int8(10.5).cgFloat, 10)
        XCTAssertEqual(Int8(5.5).float, 5)

        XCTAssertEqual(Int16(10.5).cgFloat, 10)
        XCTAssertEqual(Int16(5.5).float, 5)

        XCTAssertEqual(Int32(10.5).cgFloat, 10)
        XCTAssertEqual(Int32(5.5).float, 5)

        XCTAssertEqual(Int64(10.5).cgFloat, 10)
        XCTAssertEqual(Int64(5.5).float, 5)
    }
}
