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
extension AnchorKitSpacing: AnchorKitConstant {}

public func * (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    return AnchorKitSpacing(multiplier: lhs.multiplier * rhs.cgFloat)
}

public func * (lhs: FloatRepresentable, rhs: AnchorKitSpacing) -> AnchorKitSpacing {
    return AnchorKitSpacing(multiplier: rhs.multiplier * lhs.cgFloat)
}

public func / (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    return AnchorKitSpacing(multiplier: lhs.multiplier / rhs.cgFloat)
}

public func + (lhs: NSLayoutXAxisAnchor,
               rhs: AnchorKitSpacing) -> AnchorKitAttribute<NSLayoutXAxisAnchor, AnchorKitSpacing> {
    return AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (lhs: NSLayoutYAxisAnchor,
               rhs: AnchorKitSpacing) -> AnchorKitAttribute<NSLayoutYAxisAnchor, AnchorKitSpacing> {
    return AnchorKitAttribute(anchor: lhs, constant: rhs)
}
