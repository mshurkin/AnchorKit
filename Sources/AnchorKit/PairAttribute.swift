//
//  PairAttribute.swift
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

// MARK: Horizontal

public func + (lhs: HorizontalPair, rhs: UIEdgeInsets) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs, axis: .horizontal))
}

public func + (lhs: HorizontalPair, rhs: NSDirectionalEdgeInsets) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs, axis: .horizontal))
}

public func - (lhs: HorizontalPair, rhs: UIEdgeInsets) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs.inverted, axis: .horizontal))
}

public func - (lhs: HorizontalPair, rhs: NSDirectionalEdgeInsets) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs.inverted, axis: .horizontal))
}

public func + (
    lhs: PairAttribute<HorizontalPair>,
    rhs: UIEdgeInsets
) -> PairAttribute<HorizontalPair> {
    var attribute = lhs
    attribute.constant.first += rhs.left
    attribute.constant.second += rhs.right
    return attribute
}

public func + (
    lhs: PairAttribute<HorizontalPair>,
    rhs: NSDirectionalEdgeInsets
) -> PairAttribute<HorizontalPair> {
    var attribute = lhs
    attribute.constant.first += rhs.leading
    attribute.constant.second += rhs.trailing
    return attribute
}

public func - (
    lhs: PairAttribute<HorizontalPair>,
    rhs: UIEdgeInsets
) -> PairAttribute<HorizontalPair> {
    var attribute = lhs
    attribute.constant.first -= rhs.left
    attribute.constant.second -= rhs.right
    return attribute
}

public func - (
    lhs: PairAttribute<HorizontalPair>,
    rhs: NSDirectionalEdgeInsets
) -> PairAttribute<HorizontalPair> {
    var attribute = lhs
    attribute.constant.first -= rhs.leading
    attribute.constant.second -= rhs.trailing
    return attribute
}

// MARK: - Vertical

public func + (lhs: VerticalPair, rhs: UIEdgeInsets) -> PairAttribute<VerticalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs, axis: .vertical))
}

public func + (lhs: VerticalPair, rhs: NSDirectionalEdgeInsets) -> PairAttribute<VerticalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs, axis: .vertical))
}

public func - (lhs: VerticalPair, rhs: UIEdgeInsets) -> PairAttribute<VerticalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs.inverted, axis: .vertical))
}

public func - (lhs: VerticalPair, rhs: NSDirectionalEdgeInsets) -> PairAttribute<VerticalPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(insets: rhs.inverted, axis: .vertical))
}

public func + (lhs: PairAttribute<VerticalPair>, rhs: UIEdgeInsets) -> PairAttribute<VerticalPair> {
    var attribute = lhs
    attribute.constant.first += rhs.top
    attribute.constant.second += rhs.bottom
    return attribute
}

public func + (
    lhs: PairAttribute<VerticalPair>,
    rhs: NSDirectionalEdgeInsets
) -> PairAttribute<VerticalPair> {
    var attribute = lhs
    attribute.constant.first += rhs.top
    attribute.constant.second += rhs.bottom
    return attribute
}

public func - (lhs: PairAttribute<VerticalPair>, rhs: UIEdgeInsets) -> PairAttribute<VerticalPair> {
    var attribute = lhs
    attribute.constant.first -= rhs.top
    attribute.constant.second -= rhs.bottom
    return attribute
}

public func - (
    lhs: PairAttribute<VerticalPair>,
    rhs: NSDirectionalEdgeInsets
) -> PairAttribute<VerticalPair> {
    var attribute = lhs
    attribute.constant.first -= rhs.top
    attribute.constant.second -= rhs.bottom
    return attribute
}

// MARK: - Center

public func + (lhs: CenterPair, rhs: CGPoint) -> PairAttribute<CenterPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(point: rhs))
}

public func - (lhs: CenterPair, rhs: CGPoint) -> PairAttribute<CenterPair> {
    PairAttribute(anchor: lhs, constant: PairConstant(point: rhs.inverted))
}

public func + (lhs: PairAttribute<CenterPair>, rhs: CGPoint) -> PairAttribute<CenterPair> {
    var attribute = lhs
    attribute.constant.first += rhs.x
    attribute.constant.second += rhs.y
    return attribute
}

public func - (lhs: PairAttribute<CenterPair>, rhs: CGPoint) -> PairAttribute<CenterPair> {
    var attribute = lhs
    attribute.constant.first -= rhs.x
    attribute.constant.second -= rhs.y
    return attribute
}

// MARK: - Dimension

public func + (lhs: SizePair, rhs: CGSize) -> PairAttribute<SizePair> {
    PairAttribute(anchor: lhs, constant: PairConstant(size: rhs))
}

public func - (lhs: SizePair, rhs: CGSize) -> PairAttribute<SizePair> {
    PairAttribute(anchor: lhs, constant: PairConstant(size: rhs.inverted))
}

public func + (lhs: PairAttribute<SizePair>, rhs: CGSize) -> PairAttribute<SizePair> {
    var attribute = lhs
    attribute.constant.first += rhs.width
    attribute.constant.second += rhs.height
    return attribute
}

public func - (lhs: PairAttribute<SizePair>, rhs: CGSize) -> PairAttribute<SizePair> {
    var attribute = lhs
    attribute.constant.first -= rhs.width
    attribute.constant.second -= rhs.height
    return attribute
}

// MARK: - Generics

public func + <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, constant: PairConstant(value: rhs.cgFloat))
}

public func - <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, constant: PairConstant(value: -rhs.cgFloat))
}

public func * <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, multiplier: rhs.cgFloat)
}

public func * <FirstAnchor, SecondAnchor>(
    lhs: FloatRepresentable,
    rhs: Pair<FirstAnchor, SecondAnchor>
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: rhs, multiplier: lhs.cgFloat)
}

public func / <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, multiplier: 1 / rhs.cgFloat)
}

public func + <Anchor>(
    lhs: PairAttribute<Anchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Anchor> {
    var attribute = lhs
    attribute.constant.first += rhs.cgFloat
    attribute.constant.second += rhs.cgFloat
    return attribute
}

public func - <Anchor>(
    lhs: PairAttribute<Anchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Anchor> {
    var attribute = lhs
    attribute.constant.first -= rhs.cgFloat
    attribute.constant.second -= rhs.cgFloat
    return attribute
}

public func * <Anchor>(
    lhs: PairAttribute<Anchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Anchor> {
    var attribute = lhs
    attribute.multiplier *= rhs.cgFloat
    return attribute
}

public func / <Anchor>(
    lhs: PairAttribute<Anchor>,
    rhs: FloatRepresentable
) -> PairAttribute<Anchor> {
    var attribute = lhs
    attribute.multiplier /= rhs.cgFloat
    return attribute
}
