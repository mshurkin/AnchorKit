//
//  AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018-2022 Maxim Shurkin
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
