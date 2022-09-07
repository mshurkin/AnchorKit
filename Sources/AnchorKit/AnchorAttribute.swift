//
//  AnchorAttribute.swift
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

// MARK: - Size

public func - (
    lhs: NSLayoutXAxisAnchor,
    rhs: NSLayoutXAxisAnchor
) -> AnchorAttribute<NSLayoutDimension> {
    AnchorAttribute(anchor: rhs.anchorWithOffset(to: lhs))
}

public func - (
    lhs: NSLayoutYAxisAnchor,
    rhs: NSLayoutYAxisAnchor
) -> AnchorAttribute<NSLayoutDimension> {
    AnchorAttribute(anchor: rhs.anchorWithOffset(to: lhs))
}

// MARK: - Generics

public func + <Anchor>(lhs: Anchor, rhs: FloatRepresentable) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, constant: rhs.cgFloat)
}

public func - <Anchor>(lhs: Anchor, rhs: FloatRepresentable) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, constant: -rhs.cgFloat)
}

public func * <Anchor>(lhs: Anchor, rhs: FloatRepresentable) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, multiplier: rhs.cgFloat)
}

public func * <Anchor>(lhs: FloatRepresentable, rhs: Anchor) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: rhs, multiplier: lhs.cgFloat)
}

public func / <Anchor>(lhs: Anchor, rhs: FloatRepresentable) -> AnchorAttribute<Anchor> {
    AnchorAttribute(anchor: lhs, multiplier: 1 / rhs.cgFloat)
}

public func + <Anchor>(
    lhs: AnchorAttribute<Anchor>,
    rhs: FloatRepresentable
) -> AnchorAttribute<Anchor> {
    var attribute = lhs
    attribute.constant += rhs.cgFloat
    return attribute
}

public func - <Anchor>(
    lhs: AnchorAttribute<Anchor>,
    rhs: FloatRepresentable
) -> AnchorAttribute<Anchor> {
    var attribute = lhs
    attribute.constant -= rhs.cgFloat
    return attribute
}

public func * <Anchor>(
    lhs: AnchorAttribute<Anchor>,
    rhs: FloatRepresentable
) -> AnchorAttribute<Anchor> {
    var attribute = lhs
    attribute.multiplier *= rhs.cgFloat
    return attribute
}

public func / <Anchor>(
    lhs: AnchorAttribute<Anchor>,
    rhs: FloatRepresentable
) -> AnchorAttribute<Anchor> {
    var attribute = lhs
    attribute.multiplier /= rhs.cgFloat
    return attribute
}
