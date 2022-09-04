//
//  PairPriority.swift
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

public func ~ (lhs: HorizontalPairs, rhs: UILayoutPriority) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs.directional, priority: rhs)
}

public func ~ (lhs: HorizontalPairs, rhs: Float) -> PairAttribute<HorizontalPair> {
    PairAttribute(anchor: lhs.directional, priority: UILayoutPriority(rhs))
}

// MARK: - Size

public func ~ (lhs: CGSize, rhs: UILayoutPriority) -> PairAttribute<SizePair> {
    PairAttribute(anchor: SizePair.dimension, constant: PairConstant(size: lhs), priority: rhs)
}

public func ~ (lhs: CGSize, rhs: Float) -> PairAttribute<SizePair> {
    PairAttribute(
        anchor: SizePair.dimension,
        constant: PairConstant(size: lhs),
        priority: UILayoutPriority(rhs)
    )
}

public func ~ (lhs: FloatRepresentable, rhs: UILayoutPriority) -> PairAttribute<SizePair> {
    PairAttribute(
        anchor: SizePair.dimension,
        constant: PairConstant(value: lhs.cgFloat),
        priority: rhs
    )
}

public func ~ (lhs: FloatRepresentable, rhs: Float) -> PairAttribute<SizePair> {
    PairAttribute(
        anchor: SizePair.dimension,
        constant: PairConstant(value: lhs.cgFloat),
        priority: UILayoutPriority(rhs)
    )
}

// MARK: - Generics

public func ~ <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: UILayoutPriority
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, priority: rhs)
}

public func ~ <FirstAnchor, SecondAnchor>(
    lhs: Pair<FirstAnchor, SecondAnchor>,
    rhs: Float
) -> PairAttribute<Pair<FirstAnchor, SecondAnchor>> {
    PairAttribute(anchor: lhs, priority: UILayoutPriority(rhs))
}
