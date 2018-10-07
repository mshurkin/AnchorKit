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

public struct AnchorKitHorizontalSpacingAttribute {

    let anchor: NSLayoutXAxisAnchor
    let multiplier: CGFloat
    var priority: UILayoutPriority
}

public struct AnchorKitVerticalSpacingAttribute {

    let anchor: NSLayoutYAxisAnchor
    let multiplier: CGFloat
    var priority: UILayoutPriority
}

// MARK: - Operation

public func + (lhs: NSLayoutXAxisAnchor, rhs: AnchorKitSpacing) -> AnchorKitHorizontalSpacingAttribute {
    return AnchorKitHorizontalSpacingAttribute(anchor: lhs, multiplier: rhs.multiplier, priority: .required)
}

public func + (lhs: NSLayoutYAxisAnchor, rhs: AnchorKitSpacing) -> AnchorKitVerticalSpacingAttribute {
    return AnchorKitVerticalSpacingAttribute(anchor: lhs, multiplier: rhs.multiplier, priority: .required)
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
