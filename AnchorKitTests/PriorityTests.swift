//
//  PriorityTests.swift
//  AnchorKitTests
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

// swiftlint:disable file_length

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
}

// MARK: - UILayoutPriority

extension PriorityTests {

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

// MARK: - Axis X

extension PriorityTests {

    func testAxisXAnchorWithLayoutPriority() {
        let attribute = view.trailingAnchor ~ .defaultHigh
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testAxisXAnchorWithValue() {
        let attribute = view.leadingAnchor ~ 700
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 700)
    }

    func testAxisXAttributeWithLayoutPriority() {
        let attribute = view.leadingAnchor + 8 ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testAxisXAttributeWithValue() {
        let attribute = 8 + view.trailingAnchor ~ 1
        XCTAssertEqual(attribute.anchor, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, 8)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1)
    }
}

// MARK: - Axis Y

extension PriorityTests {

    func testAxisYAnchorWithLayoutPriority() {
        let attribute = view.bottomAnchor ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testAxisYAnchorWithValue() {
        let attribute = view.topAnchor ~ 255
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 255)
    }

    func testAxisYAttributeWithLayoutPriority() {
        let attribute = view.topAnchor - 44 ~ .defaultHigh
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant, -44)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testAxisYAttributeWithValue() {
        let attribute = 44 + view.bottomAnchor / 2 ~ 800
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, 44)
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 800)
    }
}

// MARK: - Dimension

extension PriorityTests {

    func testDimensionWithLayoutPriority() {
        let attribute = view.heightAnchor ~ .fittingSizeLevel
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 50)
    }

    func testDimensionWithValue() {
        let attribute = view.widthAnchor ~ 999
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testDimensionAttributeWithLayoutPriority() {
        let attribute = 2 * view.widthAnchor ~ .required
        XCTAssertEqual(attribute.anchor, view.widthAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testDimensionAttributeWithValue() {
        let attribute = view.heightAnchor * 2 ~ 999
        XCTAssertEqual(attribute.anchor, view.heightAnchor)
        XCTAssertEqual(attribute.constant, 0)
        XCTAssertEqual(attribute.multiplier, 2)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testFloatWithLayoutPriority() {
        let attribute: AnchorKitAttribute<NSLayoutDimension, CGFloat> = 375 ~ .defaultHigh + 1
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, 375)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 751)
    }

    func testFloatWithValue() {
        let attribute: AnchorKitAttribute<NSLayoutDimension, CGFloat> = 100 ~ 252
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, 100)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 252)
    }
}

// MARK: - Spacing

extension PriorityTests {

    func testHorizontalSpacingWithLayoutPriority() {
        let attribute = view.leadingAnchor + .systemSpacing ~ .required
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalSpacingWithValue() {
        let attribute = view.leadingAnchor + 2 * .systemSpacing ~ 999
        XCTAssertEqual(attribute.anchor, view.leadingAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 2)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 999)
    }

    func testVerticalSpacingWithLayoutPriority() {
        let attribute = view.topAnchor + .systemSpacing / 2 ~ .defaultLow
        XCTAssertEqual(attribute.anchor, view.topAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 0.5)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testVerticalSpacingWithValue() {
        let attribute = view.bottomAnchor + .systemSpacing ~ 751
        XCTAssertEqual(attribute.anchor, view.bottomAnchor)
        XCTAssertEqual(attribute.constant.multiplier, 1)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 751)
    }
}

// MARK: - Pair (Horizontal)

extension PriorityTests {

    func testHorizontalPairWithLayoutPriority() {
        let attribute = view.horizontalAnchors ~ .defaultLow
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testHorizontalPairWithValue() {
        let attribute = view.horizontalAnchors ~ 252
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 252)
    }

    func testHorizontalAttributeWithLayoutPriority() {
        let attribute = view.horizontalAnchors + 15 ~ .required
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testHorizontalAttributeWithValue() {
        let attribute = view.horizontalAnchors - UIEdgeInsets(left: 10, right: -6) ~ 749
        XCTAssertEqual(attribute.anchor.first, view.leadingAnchor)
        XCTAssertEqual(attribute.anchor.second, view.trailingAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 6))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 749)
    }
}

// MARK: - Pair (Vertical)

extension PriorityTests {

    func testVerticalPairWithLayoutPriority() {
        let attribute = view.verticalAnchors ~ .fittingSizeLevel
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 50)
    }

    func testVerticalPairWithValue() {
        let attribute = view.verticalAnchors ~ 1
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1)
    }

    func testVerticalAttributeWithLayoutPriority() {
        let attribute = view.verticalAnchors + 1 ~ .defaultHigh - 1
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 749)
    }

    func testVerticalAttributeWithValue() {
        let attribute = view.verticalAnchors - UIEdgeInsets(top: 44, bottom: 37) ~ 998
        XCTAssertEqual(attribute.anchor.first, view.topAnchor)
        XCTAssertEqual(attribute.anchor.second, view.bottomAnchor)
        XCTAssertEqual(attribute.constant, UIEdgeInsets(top: -44, left: 0, bottom: -37, right: 0))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 998)
    }
}

// MARK: - Pair (Center)

extension PriorityTests {

    func testCenterPairWithLayoutPriority() {
        let attribute = view.centerAnchors ~ .defaultHigh
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }

    func testCenterPairWithValue() {
        let attribute = view.centerAnchors ~ 222
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 222)
    }

    func testCenterAttributeWithLayoutPriority() {
        let attribute = view.centerAnchors + UIOffset(horizontal: 0, vertical: 15) ~ .required
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 0, vertical: 15))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testCenterAttributeWithValue() {
        let attribute = view.centerAnchors + 10 ~ 760
        XCTAssertEqual(attribute.anchor.first, view.centerXAnchor)
        XCTAssertEqual(attribute.anchor.second, view.centerYAnchor)
        XCTAssertEqual(attribute.constant, UIOffset(horizontal: 10, vertical: 10))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 760)
    }
}

// MARK: - Priority (Size)

extension PriorityTests {

    func testSizePairWithLayoutPriority() {
        let attribute = view.sizeAnchors ~ .fittingSizeLevel
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 50)
    }

    func testSizePairWithValue() {
        let attribute = view.sizeAnchors ~ 51
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, .zero)
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 51)
    }

    func testSizeAttributeWithLayoutPriority() {
        let attribute = view.sizeAnchors + 24 ~ .defaultLow - 2
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 24, height: 24))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 248)
    }

    func testSizeAttributeWithValue() {
        let attribute = view.sizeAnchors / 2 + CGSize(width: 1, height: 15) ~ 1000
        XCTAssertEqual(attribute.anchor.first, view.widthAnchor)
        XCTAssertEqual(attribute.anchor.second, view.heightAnchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 1, height: 15))
        XCTAssertEqual(attribute.multiplier, 0.5)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testSizeWithLayoutPriority() {
        let attribute = CGSize(width: 15, height: 4) ~ .defaultLow
        XCTAssertNil(attribute.anchor)
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 15, height: 4))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 250)
    }

    func testSizeWithValue() {
        let attribute = CGSize(width: 50, height: 24) ~ 751
        XCTAssertNil(attribute.anchor)
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 50, height: 24))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 751)
    }

    func testFloatForPairWithLayoutPriority() {
        let attribute: AnchorKitAttribute<AnchorKitSizePair, CGSize> = 24 ~ .required
        XCTAssertNil(attribute.anchor)
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 24, height: 24))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 1000)
    }

    func testFloatForPairWithValue() {
        let attribute: AnchorKitAttribute<AnchorKitSizePair, CGSize> = 36 ~ 750
        XCTAssertNil(attribute.anchor)
        XCTAssertNil(attribute.anchor)
        XCTAssertEqual(attribute.constant, CGSize(width: 36, height: 36))
        XCTAssertEqual(attribute.multiplier, 1)
        XCTAssertEqual(attribute.priority.rawValue, 750)
    }
}
