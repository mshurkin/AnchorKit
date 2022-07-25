//
//  AnchorKit+Constraints.swift
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

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func >= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

@discardableResult
public func <= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualTo: rhs).activate()
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
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    lhs.constraint(equalToConstant: rhs.cgFloat).activate()
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate()
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate()
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
    lhs.constraint(equalTo: rhs)
}

@discardableResult
public func == <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    lhs.constraint(equalTo: rhs)
}

@discardableResult
public func >= <T, U>(lhs: AnchorKitPair<T, U>, rhs: AnchorKitPair<T, U>) -> [NSLayoutConstraint] {
    lhs.constraints(greaterThanOrEqualTo: rhs)
}

@discardableResult
public func >= <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    lhs.constraints(greaterThanOrEqualTo: rhs)
}

@discardableResult
public func <= <T, U>(lhs: AnchorKitPair<T, U>, rhs: AnchorKitPair<T, U>) -> [NSLayoutConstraint] {
    lhs.constraints(lessThanOrEqualTo: rhs)
}

@discardableResult
public func <= <T, U, C>(lhs: AnchorKitPair<T, U>,
                         rhs: AnchorKitAttribute<AnchorKitPair<T, U>, C>) -> [NSLayoutConstraint] {
    lhs.constraints(lessThanOrEqualTo: rhs)
}

// MARK: - Pair (Size)

@discardableResult
public func == (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    [lhs.first.constraint(equalToConstant: rhs.width).activate(),
     lhs.second.constraint(equalToConstant: rhs.height).activate()]
}

@discardableResult
public func == (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    [lhs.first.constraint(equalToConstant: rhs.cgFloat).activate(),
     lhs.second.constraint(equalToConstant: rhs.cgFloat).activate()]
}

@discardableResult
public func >= (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    [lhs.first.constraint(greaterThanOrEqualToConstant: rhs.width).activate(),
     lhs.second.constraint(greaterThanOrEqualToConstant: rhs.height).activate()]
}

@discardableResult
public func >= (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    [lhs.first.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate(),
     lhs.second.constraint(greaterThanOrEqualToConstant: rhs.cgFloat).activate()]
}

@discardableResult
public func <= (lhs: AnchorKitSizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    [lhs.first.constraint(lessThanOrEqualToConstant: rhs.width).activate(),
     lhs.second.constraint(lessThanOrEqualToConstant: rhs.height).activate()]
}

@discardableResult
public func <= (lhs: AnchorKitSizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    [lhs.first.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate(),
     lhs.second.constraint(lessThanOrEqualToConstant: rhs.cgFloat).activate()]
}
