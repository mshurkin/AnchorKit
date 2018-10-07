//
//  SpacingTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

@testable import AnchorKit
import XCTest

class SpacingTests: XCTestCase {

    var superview: UIView!
    var view: UIView!
    var label: UILabel!

    override func setUp() {
        super.setUp()

        view = UIView()
        label = UILabel()
        superview = UIView()
        superview.addSubview(view)
        superview.addSubview(label)
    }

    override func tearDown() {
        view = nil
        label = nil
        superview = nil

        super.tearDown()
    }
}

// MARK: - Spacing

extension SpacingTests {

    func testXAxisAnchorWithSpacing() {
        let attribute = view.leadingAnchor + .systemSpacing
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testYAxisAnchorWithSpacing() {
        let attribute = view.topAnchor + .systemSpacing * 2
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSpacingWithMultiplier() {
        let spacing = AnchorKitSpacing.systemSpacing * 3
        XCTAssertEqual(spacing.multiplier, 3)
    }

    func testMultiplierWithSpacing() {
        let spacing = 0.5 * AnchorKitSpacing.systemSpacing
        XCTAssertEqual(spacing.multiplier, 0.5)
    }

    func testSpacingWithDivider() {
        let spacing = AnchorKitSpacing.systemSpacing / 10
        XCTAssertEqual(spacing.multiplier, 0.1)
    }
}
