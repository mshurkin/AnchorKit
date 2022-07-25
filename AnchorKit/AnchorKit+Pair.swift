//
//  AnchorKit+Pair.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 05/10/2018.
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

public protocol AnchorKitPairConstant: AnchorKitConstant {

    static func += (lhs: inout Self, rhs: Self)
    static func += (lhs: inout Self, rhs: CGFloat)
    static func -= (lhs: inout Self, rhs: Self)
    static func -= (lhs: inout Self, rhs: CGFloat)
}

public struct AnchorKitPair<FirstAnchor: AnchorKitAnchor, SecondAnchor: AnchorKitAnchor>: AnchorKitAnchor {

    let first: FirstAnchor
    let second: SecondAnchor
}

extension AnchorKitPair {

    func constraint(equalTo pair: AnchorKitPair) -> [NSLayoutConstraint] {
        switch (self, pair) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair):
            return [lhs.first.constraint(equalTo: rhs.first).activate(),
                    lhs.second.constraint(equalTo: rhs.second).activate()]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair):
            return [lhs.first.constraint(equalTo: rhs.first).activate(),
                    lhs.second.constraint(equalTo: rhs.second).activate()]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair):
            return [lhs.first.constraint(equalTo: rhs.first).activate(),
                    lhs.second.constraint(equalTo: rhs.second).activate()]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair):
            return [lhs.first.constraint(equalTo: rhs.first).activate(),
                    lhs.second.constraint(equalTo: rhs.second).activate()]
        default:
            return []
        }
    }

    func constraint<C>(equalTo attribute: AnchorKitAttribute<AnchorKitPair, C>) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint]
        switch (self, attribute.anchor, attribute.constant) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(equalTo: rhs.first, constant: constant.left),
                           lhs.second.constraint(equalTo: rhs.second, constant: -constant.right)]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(equalTo: rhs.first, constant: constant.top),
                           lhs.second.constraint(equalTo: rhs.second, constant: -constant.bottom)]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair, constant as UIOffset):
            constraints = [lhs.first.constraint(equalTo: rhs.first, constant: constant.horizontal),
                           lhs.second.constraint(equalTo: rhs.second, constant: constant.vertical)]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair, constant as CGSize):
            let multiplier = attribute.multiplier
            constraints = [lhs.first.constraint(equalTo: rhs.first, multiplier: multiplier, constant: constant.width),
                           lhs.second.constraint(equalTo: rhs.second, multiplier: multiplier, constant: constant.height)]
        case let (lhs as AnchorKitSizePair, .none, constant as CGSize):
            constraints = [lhs.first.constraint(equalToConstant: constant.width),
                           lhs.second.constraint(equalToConstant: constant.height)]
        default:
            return []
        }

        return constraints.map {
            let constraint = $0.with(multiplier: attribute.multiplier)
            constraint.priority = attribute.priority
            return constraint.activate()
        }
    }

    func constraints(greaterThanOrEqualTo pair: AnchorKitPair) -> [NSLayoutConstraint] {
        switch (self, pair) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair):
            return [lhs.first.constraint(lessThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(greaterThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair):
            return [lhs.first.constraint(lessThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(greaterThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair):
            return [lhs.first.constraint(greaterThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(greaterThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair):
            return [lhs.first.constraint(greaterThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(greaterThanOrEqualTo: rhs.second).activate()]
        default:
            return []
        }
    }

    func constraints<C>(greaterThanOrEqualTo attribute: AnchorKitAttribute<AnchorKitPair, C>) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint]
        switch (self, attribute.anchor, attribute.constant) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(lessThanOrEqualTo: rhs.first, constant: constant.left),
                           lhs.second.constraint(greaterThanOrEqualTo: rhs.second, constant: -constant.right)]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(lessThanOrEqualTo: rhs.first, constant: constant.top),
                           lhs.second.constraint(greaterThanOrEqualTo: rhs.second, constant: -constant.bottom)]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair, constant as UIOffset):
            constraints = [lhs.first.constraint(greaterThanOrEqualTo: rhs.first, constant: constant.horizontal),
                           lhs.second.constraint(greaterThanOrEqualTo: rhs.second, constant: constant.vertical)]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair, constant as CGSize):
            let multiplier = attribute.multiplier
            constraints = [lhs.first.constraint(greaterThanOrEqualTo: rhs.first,
                                                multiplier: multiplier,
                                                constant: constant.width),
                           lhs.second.constraint(greaterThanOrEqualTo: rhs.second,
                                                 multiplier: multiplier,
                                                 constant: constant.height)]
        case let (lhs as AnchorKitSizePair, .none, constant as CGSize):
            constraints = [lhs.first.constraint(greaterThanOrEqualToConstant: constant.width),
                           lhs.second.constraint(greaterThanOrEqualToConstant: constant.height)]
        default:
            return []
        }

        return constraints.map {
            let constraint = $0.with(multiplier: attribute.multiplier)
            constraint.priority = attribute.priority
            return constraint.activate()
        }
    }

    func constraints(lessThanOrEqualTo pair: AnchorKitPair) -> [NSLayoutConstraint] {
        switch (self, pair) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair):
            return [lhs.first.constraint(greaterThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(lessThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair):
            return [lhs.first.constraint(greaterThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(lessThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair):
            return [lhs.first.constraint(lessThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(lessThanOrEqualTo: rhs.second).activate()]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair):
            return [lhs.first.constraint(lessThanOrEqualTo: rhs.first).activate(),
                    lhs.second.constraint(lessThanOrEqualTo: rhs.second).activate()]
        default:
            return []
        }
    }

    func constraints<C>(lessThanOrEqualTo attribute: AnchorKitAttribute<AnchorKitPair, C>) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint]
        switch (self, attribute.anchor, attribute.constant) {
        case let (lhs as AnchorKitHorizontalPair, rhs as AnchorKitHorizontalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(greaterThanOrEqualTo: rhs.first, constant: constant.left),
                           lhs.second.constraint(lessThanOrEqualTo: rhs.second, constant: -constant.right)]
        case let (lhs as AnchorKitVerticalPair, rhs as AnchorKitVerticalPair, constant as UIEdgeInsets):
            constraints = [lhs.first.constraint(greaterThanOrEqualTo: rhs.first, constant: constant.top),
                           lhs.second.constraint(lessThanOrEqualTo: rhs.second, constant: -constant.bottom)]
        case let (lhs as AnchorKitCenterPair, rhs as AnchorKitCenterPair, constant as UIOffset):
            constraints = [lhs.first.constraint(lessThanOrEqualTo: rhs.first, constant: constant.horizontal),
                           lhs.second.constraint(lessThanOrEqualTo: rhs.second, constant: constant.vertical)]
        case let (lhs as AnchorKitSizePair, rhs as AnchorKitSizePair, constant as CGSize):
            let multiplier = attribute.multiplier
            constraints = [lhs.first.constraint(lessThanOrEqualTo: rhs.first,
                                                multiplier: multiplier,
                                                constant: constant.width),
                           lhs.second.constraint(lessThanOrEqualTo: rhs.second,
                                                 multiplier: multiplier,
                                                 constant: constant.height)]
        case let (lhs as AnchorKitSizePair, .none, constant as CGSize):
            constraints = [lhs.first.constraint(lessThanOrEqualToConstant: constant.width),
                           lhs.second.constraint(lessThanOrEqualToConstant: constant.height)]
        default:
            return []
        }

        return constraints.map {
            let constraint = $0.with(multiplier: attribute.multiplier)
            constraint.priority = attribute.priority
            return constraint.activate()
        }
    }
}

public typealias AnchorKitHorizontalPair = AnchorKitPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
public typealias AnchorKitVerticalPair = AnchorKitPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
public typealias AnchorKitCenterPair = AnchorKitPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>
public typealias AnchorKitSizePair = AnchorKitPair<NSLayoutDimension, NSLayoutDimension>

// MARK: - Operations (Axis)

public func + (lhs: AnchorKitHorizontalPair,
               rhs: UIEdgeInsets) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (lhs: UIEdgeInsets,
               rhs: AnchorKitHorizontalPair) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: rhs, constant: lhs)
}

public func + (lhs: AnchorKitHorizontalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: UIEdgeInsets(rhs.cgFloat))
}

public func + (lhs: FloatRepresentable,
               rhs: AnchorKitHorizontalPair) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: rhs, constant: UIEdgeInsets(lhs.cgFloat))
}

public func + (lhs: AnchorKitVerticalPair,
               rhs: UIEdgeInsets) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (lhs: UIEdgeInsets,
               rhs: AnchorKitVerticalPair) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: rhs, constant: lhs)
}

public func + (lhs: AnchorKitVerticalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: UIEdgeInsets(rhs.cgFloat))
}

public func + (lhs: FloatRepresentable,
               rhs: AnchorKitVerticalPair) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: rhs, constant: UIEdgeInsets(lhs.cgFloat))
}

public func - (lhs: AnchorKitHorizontalPair,
               rhs: UIEdgeInsets) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: -rhs)
}

public func - (lhs: AnchorKitHorizontalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitHorizontalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: UIEdgeInsets(-rhs.cgFloat))
}

public func - (lhs: AnchorKitVerticalPair,
               rhs: UIEdgeInsets) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: -rhs)
}

public func - (lhs: AnchorKitVerticalPair,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitVerticalPair, UIEdgeInsets> {
    AnchorKitAttribute(anchor: lhs, constant: UIEdgeInsets(-rhs.cgFloat))
}

// MARK: - Operations (Center)

public func + (lhs: AnchorKitCenterPair, rhs: UIOffset) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (lhs: UIOffset, rhs: AnchorKitCenterPair) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: rhs, constant: lhs)
}

public func + (lhs: AnchorKitCenterPair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: UIOffset(rhs.cgFloat))
}

public func + (lhs: FloatRepresentable, rhs: AnchorKitCenterPair) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: rhs, constant: UIOffset(lhs.cgFloat))
}

public func - (lhs: AnchorKitCenterPair, rhs: UIOffset) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: -rhs)
}

public func - (lhs: AnchorKitCenterPair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitCenterPair, UIOffset> {
    AnchorKitAttribute(anchor: lhs, constant: UIOffset(-rhs.cgFloat))
}

// MARK: - Operations (Dimension)

public func + (lhs: AnchorKitSizePair, rhs: CGSize) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (lhs: CGSize, rhs: AnchorKitSizePair) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: rhs, constant: lhs)
}

public func + (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: CGSize(rhs.cgFloat))
}

public func + (lhs: FloatRepresentable, rhs: AnchorKitSizePair) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: rhs, constant: CGSize(lhs.cgFloat))
}

public func - (lhs: AnchorKitSizePair, rhs: CGSize) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: -rhs)
}

public func - (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: CGSize(-rhs.cgFloat))
}

public func * (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, multiplier: rhs.cgFloat)
}

public func * (lhs: FloatRepresentable, rhs: AnchorKitSizePair) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: rhs, constant: .zero, multiplier: lhs.cgFloat)
}

public func * (lhs: AnchorKitAttribute<AnchorKitSizePair, CGSize>,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    var attribute = lhs
    attribute.multiplier *= rhs.cgFloat
    return attribute
}

public func * (lhs: FloatRepresentable,
               rhs: AnchorKitAttribute<AnchorKitSizePair, CGSize>) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    var attribute = rhs
    attribute.multiplier *= lhs.cgFloat
    return attribute
}

public func / (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    AnchorKitAttribute(anchor: lhs, constant: .zero, multiplier: 1 / rhs.cgFloat)
}

public func / (lhs: AnchorKitAttribute<AnchorKitSizePair, CGSize>,
               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitSizePair, CGSize> {
    var attribute = lhs
    attribute.multiplier /= rhs.cgFloat
    return attribute
}

// MARK: - Operation (Общие)

public func + <T, U, C: AnchorKitPairConstant>(lhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>,
                                               rhs: C) -> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = lhs
    attribute.constant += rhs
    return attribute
}

public func + <T, U, C: AnchorKitPairConstant>(lhs: C, rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>)
-> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = rhs
    attribute.constant += lhs
    return attribute
}

public func + <T, U, C: AnchorKitPairConstant>(lhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>,
                                               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = lhs
    attribute.constant += rhs.cgFloat
    return attribute
}

public func + <T, U, C: AnchorKitPairConstant>(lhs: FloatRepresentable, rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>)
-> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = rhs
    attribute.constant += lhs.cgFloat
    return attribute
}

public func - <T, U, C: AnchorKitPairConstant>(lhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>,
                                               rhs: C) -> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = lhs
    attribute.constant -= rhs
    return attribute
}

public func - <T, U, C: AnchorKitPairConstant>(lhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>,
                                               rhs: FloatRepresentable) -> AnchorKitAttribute<AnchorKitPair<T, U>, C> {
    var attribute = lhs
    attribute.constant -= rhs.cgFloat
    return attribute
}
