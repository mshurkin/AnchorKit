//
//  AnchorConstraints.swift
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

import UIKit

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    lhs.constraint(equalTo: rhs).activate()
}

// MARK: - Dimension

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
public func == (
    lhs: NSLayoutDimension,
    rhs: AnchorAttribute<NSLayoutDimension>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if rhs.anchor is LayoutDimension {
        constraint = lhs.constraint(equalToConstant: rhs.constant)
    } else {
        constraint = lhs.constraint(
            equalTo: rhs.anchor,
            multiplier: rhs.multiplier,
            constant: rhs.constant
        )
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (
    lhs: NSLayoutDimension,
    rhs: AnchorAttribute<NSLayoutDimension>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if rhs.anchor is LayoutDimension {
        constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs.constant)
    } else {
        constraint = lhs.constraint(
            greaterThanOrEqualTo: rhs.anchor,
            multiplier: rhs.multiplier,
            constant: rhs.constant
        )
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (
    lhs: NSLayoutDimension,
    rhs: AnchorAttribute<NSLayoutDimension>
) -> NSLayoutConstraint {
    let constraint: NSLayoutConstraint
    if rhs.anchor is LayoutDimension {
        constraint = lhs.constraint(lessThanOrEqualToConstant: rhs.constant)
    } else {
        constraint = lhs.constraint(
            lessThanOrEqualTo: rhs.anchor,
            multiplier: rhs.multiplier,
            constant: rhs.constant
        )
    }
    constraint.priority = rhs.priority
    return constraint.activate()
}

// MARK: - Generics

@discardableResult
public func >= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>
) -> NSLayoutConstraint {
    lhs.constraint(greaterThanOrEqualTo: rhs).activate()
}

@discardableResult
public func <= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>
) -> NSLayoutConstraint {
    lhs.constraint(lessThanOrEqualTo: rhs).activate()
}

@discardableResult
public func == <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: AnchorAttribute<NSLayoutAnchor<AnchorType>>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: AnchorAttribute<NSLayoutAnchor<AnchorType>>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: AnchorAttribute<NSLayoutAnchor<AnchorType>>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        .with(multiplier: rhs.multiplier)
    constraint.priority = rhs.priority
    return constraint.activate()
}
