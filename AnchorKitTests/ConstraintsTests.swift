//
//  ConstraintsTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

// swiftlint:disable file_length

@testable import AnchorKit
import XCTest

class ConstraintsTests: XCTestCase {

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

// MARK: - Axis

extension ConstraintsTests {

    func testEqualityForHorizontalAnchors() {
        let constraint = view.leadingAnchor == superview.leadingAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testEqualityForVerticalAnchors() {
        let constraint = view.topAnchor == superview.topAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForHorizontalAnchors() {
        let constraint = view.trailingAnchor >= superview.trailingAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForVerticalAnchors() {
        let constraint = view.bottomAnchor >= superview.bottomAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testLessThanForHorizontalAnchors() {
        let constraint = view.leadingAnchor <= superview.trailingAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testLessThanForVerticalAnchors() {
        let constraint = view.topAnchor <= superview.bottomAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testEqualityForHorizontalAnchorAndAttribute() {
        let constraint = view.trailingAnchor == superview.trailingAnchor / 2 + 16
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testEqualityForVerticalAnchorAndAttribute() {
        let constraint = view.bottomAnchor == superview.bottomAnchor ~ .defaultHigh
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 750)
    }

    func testGreaterThanForHorizontalAnchorAndAttribute() {
        let constraint = view.leadingAnchor >= 0.5 * superview.trailingAnchor + 24
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 24)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForVerticalAnchorAndAttribute() {
        let constraint = view.topAnchor >= 8 + superview.bottomAnchor ~ 750
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority.rawValue, 750)
    }

    func testLessThanForHorizontalAnchorAndAttribute() {
        let constraint = view.trailingAnchor <= superview.leadingAnchor * 1.5 - 16 ~ 251
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1.5)
        XCTAssertEqual(constraint.constant, -16)
        XCTAssertEqual(constraint.priority.rawValue, 251)
    }

    func testLessThanForVerticalAnchorAndAttribute() {
        let constraint = view.bottomAnchor <= superview.bottomAnchor ~ .defaultHigh - 1
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 749)
    }
}

// MARK: - NSLayoutDimension

extension ConstraintsTests {

    func testEqualityForDimensions() {
        let constraint = view.widthAnchor == superview.heightAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testEqualityForDimensionsWithPriority() {
        let constraint = view.widthAnchor == superview.heightAnchor ~ 249
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 249)
    }

    func testEqualityForDimensionAndValue() {
        let constraint = view.widthAnchor == 375
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 375)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testEqualityForDimensionAndValueWithPriority() {
        let constraint = view.heightAnchor == 320 ~ 998
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority.rawValue, 998)
    }

    func testEqualityForDimensionAndAttribute() {
        let constraint = view.heightAnchor == 2 * superview.heightAnchor - 8 ~ 400
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 2)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.priority.rawValue, 400)
    }

    func testGreaterThanForDimensions() {
        let constraint = view.heightAnchor >= superview.widthAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForDimensionsWithPriority() {
        let constraint = view.heightAnchor >= superview.heightAnchor ~ .defaultHigh
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 750)
    }

    func testGreaterThanForDimensionAndValue() {
        let constraint = view.widthAnchor >= 100
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForDimensionAndValueWithPriority() {
        let constraint = view.widthAnchor >= 100 ~ 500
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.priority.rawValue, 500)
    }

    func testGreaterThanForDimensionAndAttribute() {
        let constraint = view.heightAnchor >= superview.heightAnchor * 2 - 8 ~ 400
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 2)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.priority.rawValue, 400)
    }

    func testLessThanForDimensions() {
        let constraint = view.heightAnchor <= superview.heightAnchor
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testLessThanForDimensionsWithPriority() {
        let constraint = view.heightAnchor <= superview.widthAnchor ~ .defaultHigh + 2
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 752)
    }

    func testLessThanForDimensionAndValue() {
        let constraint = view.heightAnchor <= 320
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testLessThanForDimensionAndValueWithPriority() {
        let constraint = view.heightAnchor <= 320 ~ .required - 400
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 320)
        XCTAssertEqual(constraint.priority.rawValue, 600)
    }

    func testLessThanForDimensionAndAttribute() {
        let constraint = view.widthAnchor <= 48 + superview.heightAnchor / 2 ~ 999
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 48)
        XCTAssertEqual(constraint.priority.rawValue, 999)
    }
}

// MARK: - Activate

extension ConstraintsTests {

    func testConstraintForLabelWithView() {
        let constaint = label.leadingAnchor == view.leadingAnchor + 8 ~ 249
        XCTAssertTrue(constaint.firstItem === label)
        XCTAssertEqual(constaint.firstAttribute, .leading)
        XCTAssertEqual(constaint.relation, .equal)
        XCTAssertTrue(constaint.secondItem === view)
        XCTAssertEqual(constaint.secondAttribute, .leading)
        XCTAssertEqual(constaint.multiplier, 1)
        XCTAssertEqual(constaint.constant, 8)
        XCTAssertEqual(constaint.priority.rawValue, 249)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }

    func testConstraintForViewWithLabel() {
        let constaint = view.topAnchor >= label.topAnchor + 16
        XCTAssertTrue(constaint.firstItem === view)
        XCTAssertEqual(constaint.firstAttribute, .top)
        XCTAssertEqual(constaint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constaint.secondItem === label)
        XCTAssertEqual(constaint.secondAttribute, .top)
        XCTAssertEqual(constaint.multiplier, 1)
        XCTAssertEqual(constaint.constant, 16)
        XCTAssertEqual(constaint.priority.rawValue, 1000)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }

    func testConstraintForLabelWithSuperview() {
        let constaint = label.trailingAnchor == superview.trailingAnchor / 2 - 8
        XCTAssertTrue(constaint.firstItem === label)
        XCTAssertEqual(constaint.firstAttribute, .trailing)
        XCTAssertEqual(constaint.relation, .equal)
        XCTAssertTrue(constaint.secondItem === superview)
        XCTAssertEqual(constaint.secondAttribute, .trailing)
        XCTAssertEqual(constaint.multiplier, 0.5)
        XCTAssertEqual(constaint.constant, -8)
        XCTAssertEqual(constaint.priority.rawValue, 1000)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }

    func testConstraintForSuperviewWithView() {
        let constaint = superview.heightAnchor == view.heightAnchor / 2 ~ 999
        XCTAssertTrue(constaint.firstItem === superview)
        XCTAssertEqual(constaint.firstAttribute, .height)
        XCTAssertEqual(constaint.relation, .equal)
        XCTAssertTrue(constaint.secondItem === view)
        XCTAssertEqual(constaint.secondAttribute, .height)
        XCTAssertEqual(constaint.multiplier, 0.5)
        XCTAssertEqual(constaint.constant, 0)
        XCTAssertEqual(constaint.priority.rawValue, 999)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(superview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }

    func testConstraintForViewWithLayoutGuide() {
        let constaint = view.bottomAnchor <= superview.safeAreaLayoutGuide.bottomAnchor - 34
        XCTAssertTrue(constaint.firstItem === view)
        XCTAssertEqual(constaint.firstAttribute, .bottom)
        XCTAssertEqual(constaint.relation, .lessThanOrEqual)
        XCTAssertTrue(constaint.secondItem === superview.safeAreaLayoutGuide)
        XCTAssertEqual(constaint.secondAttribute, .bottom)
        XCTAssertEqual(constaint.multiplier, 1)
        XCTAssertEqual(constaint.constant, -34)
        XCTAssertEqual(constaint.priority.rawValue, 1000)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }

    func testConstraintForLayoutGuideWithView() {
        let constaint = superview.safeAreaLayoutGuide.bottomAnchor >= view.bottomAnchor - 34
        XCTAssertTrue(constaint.firstItem === superview.safeAreaLayoutGuide)
        XCTAssertEqual(constaint.firstAttribute, .bottom)
        XCTAssertEqual(constaint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constaint.secondItem === view)
        XCTAssertEqual(constaint.secondAttribute, .bottom)
        XCTAssertEqual(constaint.multiplier, 1)
        XCTAssertEqual(constaint.constant, -34)
        XCTAssertEqual(constaint.priority.rawValue, 1000)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constaint.isActive)
    }
}

// MARK: - Spacing

extension ConstraintsTests {

    func testEqualityForHorizontalAnchorsWithSystemSpacing() {
        let constraint = label.trailingAnchor == view.trailingAnchor + .systemSpacing
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForHorizontalAnchorsWithSystemSpacingAndPriority() {
        let constraint = label.trailingAnchor == view.trailingAnchor + .systemSpacing ~ 555
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority.rawValue, 555)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForHorizontalAnchorsWithSystemSpacing() {
        let constraint = label.leadingAnchor >= view.leadingAnchor + .systemSpacing * 2 ~ .defaultLow
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority.rawValue, 250)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForHorizontalAnchorsWithSystemSpacing() {
        let constraint = label.leadingAnchor <= view.trailingAnchor + .systemSpacing / 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForVerticalAnchorsWithSystemSpacing() {
        let constraint = label.topAnchor == view.topAnchor + .systemSpacing
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testEqualityForVerticalAnchorsWithSystemSpacingWithPriority() {
        let constraint = label.topAnchor == view.topAnchor + .systemSpacing ~ .defaultHigh
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.priority.rawValue, 750)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testGreaterThanForVerticalAnchorsWithSystemSpacing() {
        let constraint = label.topAnchor >= view.topAnchor + .systemSpacing * 2
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }

    func testLessThanForVerticalAnchorsWithSystemSpacing() {
        let constraint = label.bottomAnchor <= view.bottomAnchor + .systemSpacing / 2 ~ 256
        XCTAssertTrue(constraint.firstItem === label)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === view)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 4)
        XCTAssertEqual(constraint.priority.rawValue, 256)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(constraint.isActive)
    }
}
