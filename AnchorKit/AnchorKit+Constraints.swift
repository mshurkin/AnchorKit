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
public func >= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

@discardableResult
public func <= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs).activate()
}

@discardableResult
public func == <T>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<NSLayoutAnchor<T>, CGFloat>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant).with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= <T>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<NSLayoutAnchor<T>, CGFloat>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= <T>(lhs: NSLayoutAnchor<T>, rhs: AnchorKitAttribute<NSLayoutAnchor<T>, CGFloat>) -> NSLayoutConstraint {
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
public func == (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor {
        constraint = lhs.constraint(equalTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(equalToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor {
        constraint = lhs.constraint(greaterThanOrEqualTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: AnchorKitAttribute<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if let anchor = rhs.anchor {
        constraint = lhs.constraint(lessThanOrEqualTo: anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    } else {
        constraint = lhs.constraint(lessThanOrEqualToConstant: rhs.constant)
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

// MARK: - Spacing

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutXAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalToSystemSpacingAfter: rhs.anchor, multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutXAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutXAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs.anchor,
                                    multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutXAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutXAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualToSystemSpacingAfter: rhs.anchor,
                                    multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutYAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalToSystemSpacingBelow: rhs.anchor, multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (lhs: NSLayoutYAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutYAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs.anchor,
                                    multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (lhs: NSLayoutYAxisAnchor,
                rhs: AnchorKitAttribute<NSLayoutYAxisAnchor, AnchorKitSpacing>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualToSystemSpacingBelow: rhs.anchor,
                                    multiplier: rhs.constant.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

// MARK: - Pair

@discardableResult
public func == <T, U>(lhs: AnchorKitPair<T, U>, rhs: AnchorKitPair<T, U>) -> [NSLayoutConstraint] {
    return lhs.constraint(equalTo: rhs)
}

@discardableResult
public func == <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    return lhs.constraint(equalTo: rhs)
}

@discardableResult
public func >= <T, U>(lhs: AnchorKitPair<T, U>, rhs: AnchorKitPair<T, U>) -> [NSLayoutConstraint] {
    return lhs.constraints(greaterThanOrEqualTo: rhs)
}

@discardableResult
public func >= <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    return lhs.constraints(greaterThanOrEqualTo: rhs)
}

@discardableResult
public func <= <T, U>(lhs: AnchorKitPair<T, U>, rhs: AnchorKitPair<T, U>) -> [NSLayoutConstraint] {
    return lhs.constraints(lessThanOrEqualTo: rhs)
}

@discardableResult
public func <= <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    return lhs.constraints(lessThanOrEqualTo: rhs)
}

// MARK: - Pair (Size)

@discardableResult
public func == (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(equalToConstant: rhs.width).activate(),
            lhs.second.constraint(equalToConstant: rhs.height).activate()]
}

@discardableResult
public func == (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(equalToConstant: rhs.cgFloat).activate(),
            lhs.second.constraint(equalToConstant: rhs.cgFloat).activate()]
}

@discardableResult
public func >= (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(greaterThanOrEqualToConstant: rhs.width).activate(),
            lhs.second.constraint(greaterThanOrEqualToConstant: rhs.height).activate()]
}

@discardableResult
public func >= (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate(),
            lhs.second.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate()]
}

@discardableResult
public func <= (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(lessThanOrEqualToConstant: rhs.width).activate(),
            lhs.second.constraint(lessThanOrEqualToConstant: rhs.height).activate()]
}

@discardableResult
public func <= (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    return [lhs.first.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate(),
            lhs.second.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate()]
}
