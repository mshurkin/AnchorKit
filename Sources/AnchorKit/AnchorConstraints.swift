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
public func >= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>
) -> NSLayoutConstraint {
    constraint(.greater, lhs: lhs, rhs: rhs)
}

@discardableResult
public func <= <AnchorType>(
    lhs: NSLayoutAnchor<AnchorType>,
    rhs: NSLayoutAnchor<AnchorType>
) -> NSLayoutConstraint {
    constraint(.less, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == <AnchorType, Anchor: NSLayoutAnchor<AnchorType>>(
    lhs: Anchor,
    rhs: AnchorAttribute<Anchor>
) -> NSLayoutConstraint {
    constraint(.equal, lhs: lhs, rhs: rhs.anchor, constant: rhs.constant, attribute: rhs)
}

@discardableResult
public func >= <AnchorType, Anchor: NSLayoutAnchor<AnchorType>>(
    lhs: Anchor,
    rhs: AnchorAttribute<Anchor>
) -> NSLayoutConstraint {
    constraint(.greater, lhs: lhs, rhs: rhs.anchor, constant: rhs.constant, attribute: rhs)
}

@discardableResult
public func <= <AnchorType, Anchor: NSLayoutAnchor<AnchorType>>(
    lhs: Anchor,
    rhs: AnchorAttribute<Anchor>
) -> NSLayoutConstraint {
    constraint(.less, lhs: lhs, rhs: rhs.anchor, constant: rhs.constant, attribute: rhs)
}

// MARK: - Axis

@discardableResult
public func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    constraint(.equal, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    constraint(.equal, lhs: lhs, rhs: rhs)
}

// MARK: - Dimension

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    constraint(.equal, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    constraint(.equal, lhs: lhs, rhs: LayoutDimension(), constant: rhs.cgFloat)
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    constraint(.greater, lhs: lhs, rhs: LayoutDimension(), constant: rhs.cgFloat)
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: FloatRepresentable) -> NSLayoutConstraint {
    constraint(.less, lhs: lhs, rhs: LayoutDimension(), constant: rhs.cgFloat)
}

// MARK: - Constraints

func constraint<Anchor>(
    _ relation: Relation,
    lhs: NSLayoutAnchor<Anchor>,
    rhs: NSLayoutAnchor<Anchor>,
    constant: CGFloat = 0,
    attribute: LayoutAttribute? = nil
) -> NSLayoutConstraint {
    {
        switch (lhs, rhs, relation) {
        case (let lhs as NSLayoutDimension, is LayoutDimension, .less):
            return lhs.constraint(lessThanOrEqualToConstant: constant)
        case (let lhs as NSLayoutDimension, is LayoutDimension, .equal):
            return lhs.constraint(equalToConstant: constant)
        case (let lhs as NSLayoutDimension, is LayoutDimension, .greater):
            return lhs.constraint(greaterThanOrEqualToConstant: constant)
        case (_, _, .less):
            return lhs.constraint(lessThanOrEqualTo: rhs, constant: constant)
        case (_, _, .equal):
            return lhs.constraint(equalTo: rhs, constant: constant)
        case (_, _, .greater):
            return lhs.constraint(greaterThanOrEqualTo: rhs, constant: constant)
        }
    }()
        .apply(attribute: attribute)
        .activate()
}
