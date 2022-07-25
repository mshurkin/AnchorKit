//
//  AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public protocol AnchorKitAnchor {}
extension NSLayoutAnchor: AnchorKitAnchor {}

public protocol AnchorKitConstant {}
extension CGFloat: AnchorKitConstant {}

public struct AnchorKitAttribute<AnchorType: AnchorKitAnchor, ConstantType: AnchorKitConstant> {

    let anchor: AnchorType!
    var constant: ConstantType
    var multiplier: CGFloat
    var priority: UILayoutPriority

    init(anchor: AnchorType!, constant: ConstantType, multiplier: CGFloat = 1, priority: UILayoutPriority = .required) {
        self.anchor = anchor
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }
}

public func + <T>(lhs: T, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: rhs.cgFloat)
}

public func + <T>(lhs: FloatRepresentable, rhs: T) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: rhs, constant: lhs.cgFloat)
}

public func + <T>(lhs: AnchorKitAttribute<T, CGFloat>, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = lhs
    attribute.constant += rhs.cgFloat
    return attribute
}

public func + <T>(lhs: FloatRepresentable, rhs: AnchorKitAttribute<T, CGFloat>) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = rhs
    attribute.constant += lhs.cgFloat
    return attribute
}

public func - <T>(lhs: T, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: -rhs.cgFloat)
}

public func - <T>(lhs: AnchorKitAttribute<T, CGFloat>, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = lhs
    attribute.constant -= rhs.cgFloat
    return attribute
}

public func * <T>(lhs: T, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: 0, multiplier: rhs.cgFloat)
}

public func * <T>(lhs: FloatRepresentable, rhs: T) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: rhs, constant: 0, multiplier: lhs.cgFloat)
}

public func * <T>(lhs: AnchorKitAttribute<T, CGFloat>, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = lhs
    attribute.multiplier *= rhs.cgFloat
    return attribute
}

public func * <T>(lhs: FloatRepresentable, rhs: AnchorKitAttribute<T, CGFloat>) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = rhs
    attribute.multiplier *= lhs.cgFloat
    return attribute
}

public func / <T>(lhs: T, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: 0, multiplier: 1 / rhs.cgFloat)
}

public func / <T>(lhs: AnchorKitAttribute<T, CGFloat>, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    var attribute = lhs
    attribute.multiplier /= rhs.cgFloat
    return attribute
}
