//
//  Pair.swift
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

import UIKit

public typealias HorizontalPair = Pair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
public typealias VerticalPair = Pair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
public typealias CenterPair = Pair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor>
public typealias SizePair = Pair<NSLayoutDimension, NSLayoutDimension>

enum AnchorType {
    case axis, center, size
}

public struct Pair<FirstAnchor: LayoutAnchor, SecondAnchor: LayoutAnchor>: LayoutAnchor {
    let first: FirstAnchor
    let second: SecondAnchor
}

public enum HorizontalAnchorsPair {
    case absolute, directional
}

public struct PairConstant: Constant {
    var first: CGFloat
    var second: CGFloat

    init(first: CGFloat, second: CGFloat) {
        self.first = first
        self.second = second
    }

    init(value: CGFloat) {
        self.init(first: value, second: value)
    }

    init(insets: UIEdgeInsets, axis: NSLayoutConstraint.Axis) {
        switch axis {
        case .horizontal:
            self.init(first: insets.left, second: insets.right)
        case .vertical:
            self.init(first: insets.top, second: insets.bottom)
        @unknown default:
            self.init(first: 0, second: 0)
        }
    }

    init(insets: NSDirectionalEdgeInsets, axis: NSLayoutConstraint.Axis) {
        switch axis {
        case .horizontal:
            self.init(first: insets.leading, second: insets.trailing)
        case .vertical:
            self.init(first: insets.top, second: insets.bottom)
        @unknown default:
            self.init(first: 0, second: 0)
        }
    }

    init(point: CGPoint) {
        self.init(first: point.x, second: point.y)
    }

    init(size: CGSize) {
        self.init(first: size.width, second: size.height)
    }
}

public typealias PairAttribute<Anchor: LayoutAnchor> = Attribute<Anchor, PairConstant>

extension Attribute where ConstantType == PairConstant {
    init(
        anchor: AnchorType,
        constant: PairConstant = .init(value: 0),
        multiplier: CGFloat = 1,
        priority: UILayoutPriority = .required
    ) {
        self.anchor = anchor
        self.constant = constant
        self.multiplier = multiplier
        self.priority = priority
    }
}

extension SizePair {
    static var dimension: SizePair {
        SizePair(first: LayoutDimension(), second: LayoutDimension())
    }
}
