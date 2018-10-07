//
//  AnchorKit+Priority.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

precedencegroup PriorityPrecedence {

    higherThan: ComparisonPrecedence
    lowerThan: AdditionPrecedence
    associativity: none
}

infix operator ~: PriorityPrecedence

public func ~ <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: UILayoutPriority) -> AnchorKitAttribute<T> {
    return AnchorKitAttribute(anchor: lhs, constant: 0, multiplier: 1, priority: rhs)
}

public func ~ <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return lhs ~ UILayoutPriority(rawValue: rhs.float)
}

public func ~ <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: UILayoutPriority) -> AnchorKitAttribute<T> {
    var attribute = lhs
    attribute.priority = rhs
    return attribute
}

public func ~ <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return lhs ~ UILayoutPriority(rawValue: rhs.float)
}

public func ~ (lhs: FloatRepresentable, rhs: UILayoutPriority) -> AnchorKitAttribute<NSLayoutDimension> {
    return AnchorKitAttribute(anchor: nil, constant: lhs.cgFloat, multiplier: 1, priority: rhs)
}

public func ~ (lhs: FloatRepresentable, rhs: FloatRepresentable) -> AnchorKitAttribute<NSLayoutDimension> {
    return lhs ~ UILayoutPriority(rhs.float)
}

public func ~ (lhs: AnchorKitHorizontalSpacingAttribute, rhs: UILayoutPriority) -> AnchorKitHorizontalSpacingAttribute {
    var attribute = lhs
    attribute.priority = rhs
    return attribute
}

public func ~ (lhs: AnchorKitHorizontalSpacingAttribute, rhs: FloatRepresentable) -> AnchorKitHorizontalSpacingAttribute {
    return lhs ~ UILayoutPriority(rhs.float)
}

public func ~ (lhs: AnchorKitVerticalSpacingAttribute, rhs: UILayoutPriority) -> AnchorKitVerticalSpacingAttribute {
    var attribute = lhs
    attribute.priority = rhs
    return attribute
}

public func ~ (lhs: AnchorKitVerticalSpacingAttribute, rhs: FloatRepresentable) -> AnchorKitVerticalSpacingAttribute {
    return lhs ~ UILayoutPriority(rhs.float)
}
