//
//  AnchorPriority.swift
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

public func ~ <Anchor>(lhs: Anchor, rhs: UILayoutPriority) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, priority: rhs)
}

public func ~ <Anchor>(lhs: Anchor, rhs: Float) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, priority: UILayoutPriority(rhs))
}

public func ~ <Anchor, Constant>(
    lhs: Attribute<Anchor, Constant>,
    rhs: UILayoutPriority
) -> Attribute<Anchor, Constant> {
    var attribute = lhs
    attribute.priority = rhs
    return attribute
}

public func ~ <Anchor, Constant>(
    lhs: Attribute<Anchor, Constant>,
    rhs: Float
) -> Attribute<Anchor, Constant> {
    var attribute = lhs
    attribute.priority = UILayoutPriority(rhs)
    return attribute
}

// MARK: Dimension

public func ~ (
    lhs: FloatRepresentable,
    rhs: UILayoutPriority
) -> AnchorAttribute<NSLayoutDimension> {
    AnchorAttribute(anchor: LayoutDimension(), constant: lhs.cgFloat, priority: rhs)
}

public func ~ (
    lhs: FloatRepresentable,
    rhs: Float
) -> AnchorAttribute<NSLayoutDimension> {
    AnchorAttribute(
        anchor: LayoutDimension(),
        constant: lhs.cgFloat,
        priority: UILayoutPriority(rhs)
    )
}
