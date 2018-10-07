//
//  AnchorKit+Constraints.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func >= <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

@discardableResult
public func <= <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs).activate()
}

@discardableResult
public func == <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

// MARK: - NSLayoutDimension

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    return lhs.constraint(equalToConstant: rhs.cgFloat).activate()
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate()
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate()
}

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor as? NSLayoutDimension {
        constraint = lhs.constraint(equalTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(equalToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor as? NSLayoutDimension {
        constraint = lhs.constraint(greaterThanOrEqualTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor as? NSLayoutDimension {
        constraint = lhs.constraint(lessThanOrEqualTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(lessThanOrEqualToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

// MARK: - Spacing

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitHorizontalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitHorizontalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitHorizontalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitVerticalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitVerticalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitVerticalSpacingAttribute) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}
