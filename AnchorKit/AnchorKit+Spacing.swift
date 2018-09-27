//
//  AnchorKit+Spacing.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public struct AnchorKitSpacing {

    let multiplier: CGFloat

    public static let systemSpacing = AnchorKitSpacing(multiplier: 1)
}

public struct AnchorKitSpacingXAxisAnchor {

    let anchor: NSLayoutXAxisAnchor
    let multiplier: CGFloat
}

public struct AnchorKitSpacingYAxisAnchor {

    let anchor: NSLayoutYAxisAnchor
    let multiplier: CGFloat
}

// MARK: -

public func + (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitSpacing) -> AnchorKitSpacingXAxisAnchor {
    return AnchorKitSpacingXAxisAnchor(anchor: lhs, multiplier: rhs.multiplier)
}

public func + (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitSpacing) -> AnchorKitSpacingYAxisAnchor {
    return AnchorKitSpacingYAxisAnchor(anchor: lhs, multiplier: rhs.multiplier)
}

public func * (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    return AnchorKitSpacing(multiplier: lhs.multiplier * rhs.cgFloat)
}

public func * (lhs: FloatRepresentable, rhs: AnchorKitSpacing) -> AnchorKitSpacing {
    return rhs * lhs
}

public func / (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    return AnchorKitSpacing(multiplier: lhs.multiplier / rhs.cgFloat)
}

// MARK: - Constraints

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitSpacingXAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(equalToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier).activate()
}

@discardableResult
public func >= (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitSpacingXAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier).activate()
}

@discardableResult
public func <= (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitSpacingXAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.multiplier).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitSpacingYAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(equalToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier).activate()
}

@discardableResult
public func >= (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitSpacingYAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier).activate()
}

@discardableResult
public func <= (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitSpacingYAxisAnchor) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.multiplier).activate()
}
