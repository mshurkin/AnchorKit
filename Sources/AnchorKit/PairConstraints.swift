//
//  PairConstraints.swift
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

// MARK: Axis

@discardableResult
public func == <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: Pair<Anchor, Anchor>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .equal, lhs: lhs, rhs: rhs)
}

@discardableResult
public func >= <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: Pair<Anchor, Anchor>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .greater, lhs: lhs, rhs: rhs)
}

@discardableResult
public func <= <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: Pair<Anchor, Anchor>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .less, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: PairAttribute<Pair<Anchor, Anchor>>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .equal, lhs: lhs, attribute: rhs)
}

@discardableResult
public func >= <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: PairAttribute<Pair<Anchor, Anchor>>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .greater, lhs: lhs, attribute: rhs)
}

@discardableResult
public func <= <Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: PairAttribute<Pair<Anchor, Anchor>>
) -> [NSLayoutConstraint] {
    constraints(.axis, relation: .less, lhs: lhs, attribute: rhs)
}

// MARK: - Center

@discardableResult
public func == (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    constraints(.center, relation: .equal, lhs: lhs, rhs: rhs)
}

@discardableResult
public func >= (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    constraints(.center, relation: .greater, lhs: lhs, rhs: rhs)
}

@discardableResult
public func <= (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    constraints(.center, relation: .less, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    constraints(.center, relation: .equal, lhs: lhs, attribute: rhs)
}

@discardableResult
public func >= (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    constraints(.center, relation: .greater, lhs: lhs, attribute: rhs)
}

@discardableResult
public func <= (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    constraints(.center, relation: .less, lhs: lhs, attribute: rhs)
}

// MARK: - Size

@discardableResult
public func == (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    constraints(.size, relation: .equal, lhs: lhs, rhs: rhs)
}

@discardableResult
public func >= (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    constraints(.size, relation: .greater, lhs: lhs, rhs: rhs)
}

@discardableResult
public func <= (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    constraints(.size, relation: .less, lhs: lhs, rhs: rhs)
}

@discardableResult
public func == (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    constraints(.equal, lhs: lhs, constant: PairConstant(size: rhs))
}

@discardableResult
public func >= (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    constraints(.greater, lhs: lhs, constant: PairConstant(size: rhs))
}

@discardableResult
public func <= (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    constraints(.less, lhs: lhs, constant: PairConstant(size: rhs))
}

@discardableResult
public func == (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    constraints(.equal, lhs: lhs, constant: PairConstant(value: rhs.cgFloat))
}

@discardableResult
public func >= (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    constraints(.greater, lhs: lhs, constant: PairConstant(value: rhs.cgFloat))
}

@discardableResult
public func <= (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    constraints(.less, lhs: lhs, constant: PairConstant(value: rhs.cgFloat))
}

@discardableResult
public func == (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    constraints(.size, relation: .equal, lhs: lhs, attribute: rhs)
}

@discardableResult
public func >= (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    constraints(.size, relation: .greater, lhs: lhs, attribute: rhs)
}

@discardableResult
public func <= (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    constraints(.size, relation: .less, lhs: lhs, attribute: rhs)
}

// MARK: - Constraints

private func constraints<T, U, First: NSLayoutAnchor<T>, Second: NSLayoutAnchor<U>>(
    _ type: AnchorType,
    relation: Relation,
    lhs: Pair<First, Second>,
    attribute: PairAttribute<Pair<First, Second>>
) -> [NSLayoutConstraint] {
    constraints(
        type,
        relation: relation,
        lhs: lhs,
        rhs: attribute.anchor,
        constant: attribute.constant,
        attribute: attribute
    )
}

private func constraints(
    _ relation: Relation,
    lhs: SizePair,
    constant: PairConstant
) -> [NSLayoutConstraint] {
    constraints(.size, relation: relation, lhs: lhs, rhs: .dimension, constant: constant)
}

func constraints<T, U, First: NSLayoutAnchor<T>, Second: NSLayoutAnchor<U>>(
    _ type: AnchorType,
    relation: Relation,
    lhs: Pair<First, Second>,
    rhs: Pair<First, Second>,
    constant: PairConstant = PairConstant(value: 0),
    attribute: LayoutAttribute? = nil
) -> [NSLayoutConstraint] {
    // swiftlint:disable line_length
    switch (type, relation) {
    case (.axis, .less):
        return [
            constraint(.greater, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: rhs.second, rhs: lhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.axis, .equal):
        return [
            constraint(.equal, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.equal, lhs: rhs.second, rhs: lhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.axis, .greater):
        return [
            constraint(.greater, lhs: rhs.first, rhs: lhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.center, .less):
        return [
            constraint(.greater, lhs: rhs.first, rhs: lhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: rhs.second, rhs: lhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.center, .equal):
        return [
            constraint(.equal, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.equal, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.center, .greater):
        return [
            constraint(.greater, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .less) where rhs.first is LayoutDimension:
        return [
            constraint(.less, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.less, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .equal) where rhs.first is LayoutDimension:
        return [
            constraint(.equal, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.equal, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .greater) where rhs.first is LayoutDimension:
        return [
            constraint(.greater, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .less):
        return [
            constraint(.greater, lhs: rhs.first, rhs: lhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: rhs.second, rhs: lhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .equal):
        return [
            constraint(.equal, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.equal, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    case (.size, .greater):
        return [
            constraint(.greater, lhs: lhs.first, rhs: rhs.first, constant: constant.first, attribute: attribute),
            constraint(.greater, lhs: lhs.second, rhs: rhs.second, constant: constant.second, attribute: attribute)
        ]
    }
    // swiftlint:enable line_length
}
