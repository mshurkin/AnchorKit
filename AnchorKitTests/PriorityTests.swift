//
//  PriorityTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

@testable import AnchorKit
import XCTest

class PriorityTests: XCTestCase {

    var view: UIView!
    var horizontalAttribute: AnchorKitAttribute<NSLayoutXAxisAnchor>!
    var verticalAttribute: AnchorKitAttribute<NSLayoutYAxisAnchor>!
    var dimensionAttribute: AnchorKitAttribute<NSLayoutDimension>!

    override func setUp() {
        super.setUp()

        view = UIView()

        horizontalAttribute = AnchorKitAttribute(anchor: view.leadingAnchor, constant: 8, multiplier: 1, priority: .required)
        verticalAttribute = AnchorKitAttribute(anchor: view.topAnchor, constant: 44, multiplier: 1, priority: .required)
        dimensionAttribute = AnchorKitAttribute(anchor: view.widthAnchor, constant: 0, multiplier: 2, priority: .required)
    }

    override func tearDown() {
        view = nil
        horizontalAttribute = nil
        verticalAttribute = nil
        dimensionAttribute = nil

        super.tearDown()
    }

    // MARK: - Operator ~

    func testHorizontalAnchorWithLayoutPriority() {
        let attribute = view.trailingAnchor ~ .defaultHigh
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testVerticalAnchorWithLayoutPriority() {
        let attribute = view.bottomAnchor ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testDimensionWithLayoutPriority() {
        let attribute = view.heightAnchor ~ .fittingSizeLevel
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 50)
    }

    func testHorizontalAnchorWithValue() {
        let attribute = view.leadingAnchor ~ 700
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 700)
    }

    func testVerticalAnchorWithValue() {
        let attribute = view.topAnchor ~ 255
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 255)
    }

    func testDimensionWithValue() {
        let attribute = view.widthAnchor ~ 999
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testHorizontalAttributeWithLayoutPriority() {
        let attribute = horizontalAttribute ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testVerticalAttributeWithLayoutPriority() {
        let attribute = verticalAttribute ~ .defaultHigh
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testDimensionAttributeWithLayoutPriority() {
        let attribute = dimensionAttribute ~ .required
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithValue() {
        let attribute = horizontalAttribute ~ 1
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1)
    }

    func testVerticalAttributeWithValue() {
        let attribute = verticalAttribute ~ 800
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 800)
    }

    func testDimensionAttributeWithValue() {
        let attribute = dimensionAttribute ~ 999
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    // MARK: - UILayoutPriority

    func testLayoutPriorityWithMultiplier() {
        let priority = UILayoutPriority.defaultLow * 2
        XCTAssertEqual(priority.rawValue, 500)
    }

    func testMultiplierWithLayoutPriority() {
        let priority = 1.5 * UILayoutPriority.fittingSizeLevel
        XCTAssertEqual(priority.rawValue, 75)
    }

    func testLayoutPriorityWithDivider() {
        let priority = UILayoutPriority.required / 10
        XCTAssertEqual(priority.rawValue, 100)
    }
}
