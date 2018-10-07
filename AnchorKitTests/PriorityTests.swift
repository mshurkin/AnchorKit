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

    override func setUp() {
        super.setUp()

        view = UIView()
    }

    override func tearDown() {
        view = nil

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
        let attribute = view.leadingAnchor + 8 ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testVerticalAttributeWithLayoutPriority() {
        let attribute = view.topAnchor - 44 ~ .defaultHigh
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testDimensionAttributeWithLayoutPriority() {
        let attribute = 2 * view.widthAnchor ~ .required
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithValue() {
        let attribute = 8 + view.trailingAnchor ~ 1
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1)
    }

    func testVerticalAttributeWithValue() {
        let attribute = 44 + view.bottomAnchor / 2 ~ 800
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 44)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 800)
    }

    func testDimensionAttributeWithValue() {
        let attribute = view.heightAnchor * 2 ~ 999
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testFloatWithPriority() {
        let attribute = 375 ~ .defaultHigh + 1
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, 375)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 751)
    }

    func testFloatWithValue() {
        let attribute = 100 ~ 252
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, 100)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 252)
    }

    func testHorizontalSpacingWithPriority() {
        let attribute = view.leadingAnchor + .systemSpacing ~ .required
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalSpacingWithValue() {
        let attribute = view.leadingAnchor + 2 * .systemSpacing ~ 999
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testVerticalSpacingWithPriority() {
        let attribute = view.topAnchor + .systemSpacing / 2 ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testVerticalSpacingWithValue() {
        let attribute = view.bottomAnchor + .systemSpacing ~ 751
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 751)
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
