//
//  AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public struct AnchorKitAttribute<AnchorType: AnyObject> {

    let anchor: NSLayoutAnchor<AnchorType>
    var constant: CGFloat
    var multiplier: CGFloat
    var priority: UILayoutPriority
}

// MARK: -

public func + <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return AnchorKitAttribute(anchor: lhs, constant: rhs.cgFloat, multiplier: 1, priority: .required)
}

public func + <T: AnyObject>(lhs: FloatRepresentable, rhs: NSLayoutAnchor<T>) -> AnchorKitAttribute<T> {
    return rhs + lhs
}

public func + <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    var attribute = lhs
    attribute.constant += rhs.cgFloat
    return attribute
}

public func + <T: AnyObject>(lhs: FloatRepresentable, rhs: AnchorKitAttribute<T>) -> AnchorKitAttribute<T> {
    return rhs + lhs
}

public func - <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return AnchorKitAttribute(anchor: lhs, constant: -rhs.cgFloat, multiplier: 1, priority: .required)
}

public func - <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    var attribute = lhs
    attribute.constant -= rhs.cgFloat
    return attribute
}

public func * <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return AnchorKitAttribute(anchor: lhs, constant: 0, multiplier: rhs.cgFloat, priority: .required)
}

public func * <T: AnyObject>(lhs: FloatRepresentable, rhs: NSLayoutAnchor<T>) -> AnchorKitAttribute<T> {
    return rhs * lhs
}

public func * <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    var attribute = lhs
    attribute.multiplier *= rhs.cgFloat
    return attribute
}

public func * <T: AnyObject>(lhs: FloatRepresentable, rhs: AnchorKitAttribute<T>) -> AnchorKitAttribute<T> {
    return rhs * lhs
}

public func / <T: AnyObject>(lhs: NSLayoutAnchor<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    return AnchorKitAttribute(anchor: lhs, constant: 0, multiplier: 1 / rhs.cgFloat, priority: .required)
}

public func / <T: AnyObject>(lhs: AnchorKitAttribute<T>, rhs: FloatRepresentable) -> AnchorKitAttribute<T> {
    var attribute = lhs
    attribute.multiplier /= rhs.cgFloat
    return attribute
}
