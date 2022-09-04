//
//  SpacingConstraints.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 12.08.2022.
//  Copyright © 2022 Maxim Shurkin
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
public func == (
    lhs: NSLayoutXAxisAnchor,
    rhs: Attribute<NSLayoutXAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        equalToSystemSpacingAfter: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (
    lhs: NSLayoutXAxisAnchor,
    rhs: Attribute<NSLayoutXAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        greaterThanOrEqualToSystemSpacingAfter: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (
    lhs: NSLayoutXAxisAnchor,
    rhs: Attribute<NSLayoutXAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        lessThanOrEqualToSystemSpacingAfter: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func == (
    lhs: NSLayoutYAxisAnchor,
    rhs: Attribute<NSLayoutYAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        equalToSystemSpacingBelow: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func >= (
    lhs: NSLayoutYAxisAnchor,
    rhs: Attribute<NSLayoutYAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        greaterThanOrEqualToSystemSpacingBelow: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}

@discardableResult
public func <= (
    lhs: NSLayoutYAxisAnchor,
    rhs: Attribute<NSLayoutYAxisAnchor, LayoutSpacing>
) -> NSLayoutConstraint {
    let constraint = lhs.constraint(
        lessThanOrEqualToSystemSpacingBelow: rhs.anchor,
        multiplier: rhs.multiplier
    )
    constraint.priority = rhs.priority
    return constraint.activate()
}
