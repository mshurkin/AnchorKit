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
    var horizontalAttribute: AnchorKitAttribute<NSLayoutXAxisAnchor>!
    var verticalAttribute: AnchorKitAttribute<NSLayoutYAxisAnchor>!
    var dimensionAttribute: AnchorKitAttribute<NSLayoutDimension>!

    override func setUp() {
        super.setUp()

        view = UIView()
        label = UILabel()
        superview = UIView()
        superview.addSubview(view)
        superview.addSubview(label)

        horizontalAttribute = AnchorKitAttribute(anchor: superview.trailingAnchor,
                                                 constant: 16,
                                                 multiplier: 0.5,
                                                 priority: .required)
        verticalAttribute = AnchorKitAttribute(anchor: superview.bottomAnchor,
                                               constant: 0,
                                               multiplier: 1,
                                               priority: .defaultHigh)
        dimensionAttribute = AnchorKitAttribute(anchor: superview.heightAnchor,
                                                constant: -8,
                                                multiplier: 2,
                                                priority: UILayoutPriority(rawValue: 400))
    }

    override func tearDown() {
        view = nil
        label = nil
        superview = nil
        horizontalAttribute = nil
        verticalAttribute = nil
        dimensionAttribute = nil

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
        let constraint = view.trailingAnchor == horizontalAttribute
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
        let constraint = view.bottomAnchor == verticalAttribute
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
        let constraint = view.leadingAnchor >= horizontalAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForVerticalAnchorAndAttribute() {
        let constraint = view.topAnchor >= verticalAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 750)
    }

    func testLessThanForHorizontalAnchorAndAttribute() {
        let constraint = view.trailingAnchor <= horizontalAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testLessThanForVerticalAnchorAndAttribute() {
        let constraint = view.bottomAnchor <= verticalAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority.rawValue, 750)
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

    func testEqualityForDimensionAndAttribute() {
        let constraint = view.heightAnchor == dimensionAttribute
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
        let constraint = view.heightAnchor >= 100
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.priority.rawValue, 1000)
    }

    func testGreaterThanForDimensionAndValue() {
        let constraint = view.widthAnchor >= dimensionAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 2)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.priority.rawValue, 400)
    }

    func testGreaterThanForDimensionAndAttribute() {
        let constraint = view.heightAnchor >= dimensionAttribute
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
        let constraint = view.heightAnchor <= dimensionAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 2)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.priority.rawValue, 400)
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

    func testLessThanForDimensionAndAttribute() {
        let constraint = view.widthAnchor <= dimensionAttribute
        XCTAssertTrue(constraint.firstItem === view)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertTrue(constraint.secondItem === superview)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 2)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.priority.rawValue, 400)
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
