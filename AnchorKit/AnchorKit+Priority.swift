//
//  AnchorKit+Priority.swift
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

precedencegroup PriorityPrecedence {

    higherThan: ComparisonPrecedence
    lowerThan: AdditionPrecedence
    associativity: none
}

infix operator ~: PriorityPrecedence

public func ~ <T>(lhs: T, rhs: UILayoutPriority) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: 0, priority: rhs)
}

public func ~ <T>(lhs: T, rhs: FloatRepresentable) -> AnchorKitAttribute<T, CGFloat> {
    AnchorKitAttribute(anchor: lhs, constant: 0, priority: UILayoutPriority(rawValue: rhs.float))
}

public func ~ <T, C>(lhs: AnchorKitAttribute<T, C>, rhs: UILayoutPriority) -> AnchorKitAttribute<T, C> {
    var attribute = lhs
    attribute.priority = rhs
    return attribute
}

public func ~ <T, C>(lhs: AnchorKitAttribute<T, C>, rhs: FloatRepresentable) -> AnchorKitAttribute<T, C> {
    var attribute = lhs
    attribute.priority = UILayoutPriority(rawValue: rhs.float)
    return attribute
}

public func ~ (lhs: FloatRepresentable, rhs: UILayoutPriority) -> AnchorKitAttribute<NSLayoutDimension, CGFloat> {
    AnchorKitAttribute(anchor: nil, constant: lhs.cgFloat, multiplier: 1, priority: rhs)
}

public func ~ (lhs: FloatRepresentable, rhs: FloatRepresentable) -> AnchorKitAttribute<NSLayoutDimension, CGFloat> {
    let priority = UILayoutPriority(rawValue: rhs.float)
    return AnchorKitAttribute(anchor: nil, constant: lhs.cgFloat, multiplier: 1, priority: priority)
}

// MARK: - Pair (Horizontal)

public func ~ (lhs: AnchorKitHorizontalPair,
               rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: rhs)
}

public func ~ (lhs: AnchorKitHorizontalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: UILayoutPriority(rhs.float))
}

// MARK: - Pair (Vertical)

public func ~ (lhs: AnchorKitVerticalPair,
               rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: rhs)
}

public func ~ (lhs: AnchorKitVerticalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: UILayoutPriority(rhs.float))
}

// MARK: - Pair (Center)

public func ~ (lhs: AnchorKitCenterPair, rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: rhs)
}

public func ~ (lhs: AnchorKitCenterPair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: UILayoutPriority(rhs.float))
}

// MARK: - Pair (Size)

public func ~ (lhs: AnchorKitSizePair, rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: rhs)
}

public func ~ (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, priority: UILayoutPriority(rhs.float))
}

public func ~ (lhs: CGSize, rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: nil, constant: lhs, priority: rhs)
}

public func ~ (lhs: CGSize, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: nil, constant: lhs, priority: UILayoutPriority(rhs.float))
}

public func ~ (lhs: FloatRepresentable, rhs: UILayoutPriority) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: nil, constant: CGSize(lhs.cgFloat), priority: rhs)
}

public func ~ (lhs: FloatRepresentable, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: nil, constant: CGSize(lhs.cgFloat), priority: UILayoutPriority(rhs.float))
}
