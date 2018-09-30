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
        let anchor = view.leadingAnchor + .systemSpacing
        XCTAssertEqual(anchor.anchor, view.leadingAnchor)
        XCTAssertEqual(anchor.multiplier, 1)
    }

    func testYAxisAnchorWithSpacing() {
        let anchor = view.topAnchor + .systemSpacing * 2
        XCTAssertEqual(anchor.anchor, view.topAnchor)
        XCTAssertEqual(anchor.multiplier, 2)
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

// MARK: - Constraints

extension SpacingTests {

    func testEqualityForXAxisAnchor() {
        let constraint = label.trailingAnchor == view.trailingAnchor + .systemSpacing
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForXAxisAnchor() {
        let constraint = label.leadingAnchor >= view.leadingAnchor + .systemSpacing * 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForXAxisAnchor() {
        let constraint = label.leadingAnchor <= view.trailingAnchor + .systemSpacing / 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForYAxisAnchor() {
        let constraint = label.topAnchor == view.topAnchor + .systemSpacing
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForYAxisAnchor() {
        let constraint = label.topAnchor >= view.topAnchor + .systemSpacing * 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForYAxisAnchor() {
        let constraint = label.bottomAnchor <= view.bottomAnchor + .systemSpacing / 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}
