//
//  AnchorKitTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

@testable import AnchorKit
import XCTest

class AnchorKitTests: XCTestCase {

    var view: UIView!
    var horizontalAttribute: AnchorKitAttribute<NSLayoutXAxisAnchor>!
    var verticalAttribute: AnchorKitAttribute<NSLayoutYAxisAnchor>!
    var dimensionAttribute: AnchorKitAttribute<NSLayoutDimension>!

    override func setUp() {
        super.setUp()

        view = UIView()
        horizontalAttribute = AnchorKitAttribute(anchor: view.leadingAnchor, constant: 8, multiplier: 1, priority: .required)
        verticalAttribute = AnchorKitAttribute(anchor: view.topAnchor, constant: 8, multiplier: 1.5, priority: .required)
        dimensionAttribute = AnchorKitAttribute(anchor: view.widthAnchor, constant: 8, multiplier: 2, priority: .required)
    }

    override func tearDown() {
        view = nil
        horizontalAttribute = nil
        verticalAttribute = nil
        dimensionAttribute = nil

        super.tearDown()
    }
}

// MARK: - Addition

extension AnchorKitTests {

    func testHorizontalAnchorWithOffset() {
        let attribute = view.leadingAnchor + 8
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorWithOffset() {
        let attribute = view.topAnchor + 16
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimesionWithOffset() {
        let attribute = view.widthAnchor + 24
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithHorizontalAnchor() {
        let attribute = 24 + view.trailingAnchor
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithVerticalAnchor() {
        let attribute = 8 + view.bottomAnchor
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithDimension() {
        let attribute = 16 + view.heightAnchor
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributeWithOffset() {
        let attribute = horizontalAttribute + 8
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAttributeWithOffset() {
        let attribute = verticalAttribute + 16
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 24)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributeWithOffset() {
        let attribute = dimensionAttribute + 24
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 32)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithHorizontalAttribute() {
        let attribute = 24 + horizontalAttribute
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 32)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithVerticalAttribute() {
        let attribute = 8 + verticalAttribute
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 16)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testOffsetWithDimensionAttribute() {
        let attribute = 16 + dimensionAttribute
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 24)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }
}

// MARK: - Subtraction

extension AnchorKitTests {

    func testHorizontalAnchorWithNegativeOffset() {
        let attribute = view.trailingAnchor - 8
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, -8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorWithNegativeOffset() {
        let attribute = view.bottomAnchor - 16
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, -16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionWithNegativeOffset() {
        let attribute = view.heightAnchor - 24
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, -24)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributeWithNegativeOffset() {
        let attribute = horizontalAttribute - 24
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, -16)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAttributeWithNegativeOffset() {
        let attribute = verticalAttribute - 8
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributeWithNegativeOffset() {
        let attribute = dimensionAttribute - 16
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, -8)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }
}

// MARK: - Multiplication

extension AnchorKitTests {

    func testHorizontalAnchorWithMultiplier() {
        let attribute = view.leadingAnchor * 2
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorWithMultiplier() {
        let attribute = view.topAnchor * 4
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionWithMultiplier() {
        let attribute = view.widthAnchor * 8
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 8)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithHorizontalAnchor() {
        let attribute = 8 * view.trailingAnchor
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 8)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithVerticalAnchor() {
        let attribute = 2 * view.bottomAnchor
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithDimension() {
        let attribute = 4 * view.heightAnchor
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributeWithMultiplier() {
        let attribute = horizontalAttribute * 2
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAttributeWithMultiplier() {
        let attribute = verticalAttribute * 4
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 6)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributeWithMultiplier() {
        let attribute = dimensionAttribute * 8
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 16)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithHorizontalAttribute() {
        let attribute = 4 * horizontalAttribute
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithVerticalAttribute() {
        let attribute = 8 * verticalAttribute
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 12)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testMultiplierWithDimensionAttribute() {
        let attribute = 2 * dimensionAttribute
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 4)
        XCTAssertEqual(attribute.priority, .required)
    }
}

// MARK: - Division

extension AnchorKitTests {

    func testHorizontalAnchorWithDivider() {
        let attribute = view.trailingAnchor / 2
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAnchorWithDivider() {
        let attribute = view.bottomAnchor / 4
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionWithDivider() {
        let attribute = view.heightAnchor / 8
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 0.125)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testHorizontalAttributeWithDivider() {
        let attribute = horizontalAttribute / 4
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 0.25)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testVerticalAttributeWithDivider() {
        let attribute = verticalAttribute / 8
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 0.1875)
        XCTAssertEqual(attribute.priority, .required)
    }

    func testDimensionAttributeWithDivider() {
        let attribute = dimensionAttribute / 2
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority, .required)
    }
}
