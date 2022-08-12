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

// MARK: Horizontal

@discardableResult
public func == (lhs: HorizontalPairs, rhs: HorizontalPairs) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs.directional, rhs: rhs.directional, relation: .equal).activate()
}

@discardableResult
public func >= (lhs: HorizontalPairs, rhs: HorizontalPairs) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs.directional, rhs: rhs.directional, relation: .greaterThanOrEqual)
        .activate()
}

@discardableResult
public func <= (lhs: HorizontalPairs, rhs: HorizontalPairs) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs.directional, rhs: rhs.directional, relation: .lessThanOrEqual)
        .activate()
}

@discardableResult
public func == (lhs: HorizontalPair, rhs: HorizontalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .equal).activate()
}

@discardableResult
public func >= (lhs: HorizontalPair, rhs: HorizontalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .greaterThanOrEqual).activate()
}

@discardableResult
public func <= (lhs: HorizontalPair, rhs: HorizontalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .lessThanOrEqual).activate()
}

@discardableResult
public func == (lhs: HorizontalPairs, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs.directional, rhs: $0, relation: .equal, constant: $1)
    }
}

@discardableResult
public func >= (lhs: HorizontalPairs, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs.directional, rhs: $0, relation: .greaterThanOrEqual, constant: $1)
    }
}

@discardableResult
public func <= (lhs: HorizontalPairs, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs.directional, rhs: $0, relation: .lessThanOrEqual, constant: $1)
    }
}

@discardableResult
public func == (lhs: HorizontalPair, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .equal, constant: $1)
    }
}

@discardableResult
public func >= (lhs: HorizontalPair, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .greaterThanOrEqual, constant: $1)
    }
}

@discardableResult
public func <= (lhs: HorizontalPair, rhs: PairAttribute<HorizontalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .lessThanOrEqual, constant: $1)
    }
}

// MARK: - Vertical

@discardableResult
public func == (lhs: VerticalPair, rhs: VerticalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .equal).activate()
}

@discardableResult
public func >= (lhs: VerticalPair, rhs: VerticalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .greaterThanOrEqual).activate()
}

@discardableResult
public func <= (lhs: VerticalPair, rhs: VerticalPair) -> [NSLayoutConstraint] {
    axisConstraints(lhs: lhs, rhs: rhs, relation: .lessThanOrEqual).activate()
}

@discardableResult
public func == (lhs: VerticalPair, rhs: PairAttribute<VerticalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .equal, constant: $1)
    }
}

@discardableResult
public func >= (lhs: VerticalPair, rhs: PairAttribute<VerticalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .greaterThanOrEqual, constant: $1)
    }
}

@discardableResult
public func <= (lhs: VerticalPair, rhs: PairAttribute<VerticalPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        axisConstraints(lhs: lhs, rhs: $0, relation: .lessThanOrEqual, constant: $1)
    }
}

// MARK: - Center

@discardableResult
public func == (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    centerConstraints(lhs: lhs, rhs: rhs, relation: .equal).activate()
}

@discardableResult
public func >= (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    centerConstraints(lhs: lhs, rhs: rhs, relation: .greaterThanOrEqual).activate()
}

@discardableResult
public func <= (lhs: CenterPair, rhs: CenterPair) -> [NSLayoutConstraint] {
    centerConstraints(lhs: lhs, rhs: rhs, relation: .lessThanOrEqual).activate()
}

@discardableResult
public func == (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        centerConstraints(lhs: lhs, rhs: $0, relation: .equal, constant: $1)
    }
}

@discardableResult
public func >= (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        centerConstraints(lhs: lhs, rhs: $0, relation: .greaterThanOrEqual, constant: $1)
    }
}

@discardableResult
public func <= (lhs: CenterPair, rhs: PairAttribute<CenterPair>) -> [NSLayoutConstraint] {
    makeConstraints(attribute: rhs) {
        centerConstraints(lhs: lhs, rhs: $0, relation: .lessThanOrEqual, constant: $1)
    }
}

// MARK: - Size

@discardableResult
public func == (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, attribute: PairAttribute(anchor: rhs), relation: .equal)
        .activate()
}

@discardableResult
public func >= (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    sizeConstraints(
        anchors: lhs,
        attribute: PairAttribute(anchor: rhs),
        relation: .greaterThanOrEqual
    ).activate()
}

@discardableResult
public func <= (lhs: SizePair, rhs: SizePair) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, attribute: PairAttribute(anchor: rhs), relation: .lessThanOrEqual)
        .activate()
}

@discardableResult
public func == (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, constant: PairConstant(size: rhs), relation: .equal).activate()
}

@discardableResult
public func >= (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, constant: PairConstant(size: rhs), relation: .greaterThanOrEqual)
        .activate()
}

@discardableResult
public func <= (lhs: SizePair, rhs: CGSize) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, constant: PairConstant(size: rhs), relation: .lessThanOrEqual)
        .activate()
}

@discardableResult
public func == (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    sizeConstraints(anchors: lhs, constant: PairConstant(value: rhs.cgFloat), relation: .equal)
        .activate()
}

@discardableResult
public func >= (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    sizeConstraints(
        anchors: lhs,
        constant: PairConstant(value: rhs.cgFloat),
        relation: .greaterThanOrEqual
    ).activate()
}

@discardableResult
public func <= (lhs: SizePair, rhs: FloatRepresentable) -> [NSLayoutConstraint] {
    sizeConstraints(
        anchors: lhs,
        constant: PairConstant(value: rhs.cgFloat),
        relation: .lessThanOrEqual
    ).activate()
}

@discardableResult
public func == (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    makeConstraints(anchors: lhs, attribute: rhs, relation: .equal)
}

@discardableResult
public func >= (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    makeConstraints(anchors: lhs, attribute: rhs, relation: .greaterThanOrEqual)
}

@discardableResult
public func <= (lhs: SizePair, rhs: PairAttribute<SizePair>) -> [NSLayoutConstraint] {
    makeConstraints(anchors: lhs, attribute: rhs, relation: .lessThanOrEqual)
}

// MARK: - Constraints

private func axisConstraints<Axis, Anchor: NSLayoutAnchor<Axis>>(
    lhs: Pair<Anchor, Anchor>,
    rhs: Pair<Anchor, Anchor>,
    relation: NSLayoutConstraint.Relation,
    constant: PairConstant = PairConstant(value: 0)
) -> [NSLayoutConstraint] {
    switch relation {
    case .lessThanOrEqual:
        return [
            lhs.first.constraint(greaterThanOrEqualTo: rhs.first, constant: constant.first),
            rhs.second.constraint(greaterThanOrEqualTo: lhs.second, constant: constant.second)
        ]
    case .equal:
        return [
            lhs.first.constraint(equalTo: rhs.first, constant: constant.first),
            rhs.second.constraint(equalTo: lhs.second, constant: constant.second)
        ]
    case .greaterThanOrEqual:
        return [
            rhs.first.constraint(greaterThanOrEqualTo: lhs.first, constant: constant.first),
            lhs.second.constraint(greaterThanOrEqualTo: rhs.second, constant: constant.second)
        ]
    @unknown default:
        return []
    }
}

private func centerConstraints(
    lhs: CenterPair,
    rhs: CenterPair,
    relation: NSLayoutConstraint.Relation,
    constant: PairConstant = PairConstant(value: 0)
) -> [NSLayoutConstraint] {
    switch relation {
    case .lessThanOrEqual:
        return [
            rhs.first.constraint(greaterThanOrEqualTo: lhs.first, constant: constant.first),
            rhs.second.constraint(greaterThanOrEqualTo: lhs.second, constant: constant.second)
        ]
    case .equal:
        return [
            lhs.first.constraint(equalTo: rhs.first, constant: constant.first),
            lhs.second.constraint(equalTo: rhs.second, constant: constant.second)
        ]
    case .greaterThanOrEqual:
        return [
            lhs.first.constraint(greaterThanOrEqualTo: rhs.first, constant: constant.first),
            lhs.second.constraint(greaterThanOrEqualTo: rhs.second, constant: constant.second)
        ]
    @unknown default:
        return []
    }
}

private func sizeConstraints(
    anchors: SizePair,
    constant: PairConstant,
    relation: NSLayoutConstraint.Relation
) -> [NSLayoutConstraint] {
    switch relation {
    case .lessThanOrEqual:
        return [
            anchors.first.constraint(lessThanOrEqualToConstant: constant.first),
            anchors.second.constraint(lessThanOrEqualToConstant: constant.second)
        ]
    case .equal:
        return [
            anchors.first.constraint(equalToConstant: constant.first),
            anchors.second.constraint(equalToConstant: constant.second)
        ]
    case .greaterThanOrEqual:
        return [
            anchors.first.constraint(greaterThanOrEqualToConstant: constant.first),
            anchors.second.constraint(greaterThanOrEqualToConstant: constant.second)
        ]
    @unknown default:
        return []
    }
}

private func sizeConstraints(
    anchors: SizePair,
    attribute: PairAttribute<SizePair>,
    relation: NSLayoutConstraint.Relation
) -> [NSLayoutConstraint] {
    switch relation {
    case .lessThanOrEqual:
        return [
            attribute.anchor.first.constraint(
                greaterThanOrEqualTo: anchors.first,
                multiplier: attribute.multiplier,
                constant: attribute.constant.first
            ),
            attribute.anchor.second.constraint(
                greaterThanOrEqualTo: anchors.second,
                multiplier: attribute.multiplier,
                constant: attribute.constant.second
            )
        ]
    case .equal:
        return [
            anchors.first.constraint(
                equalTo: attribute.anchor.first,
                multiplier: attribute.multiplier,
                constant: attribute.constant.first
            ),
            anchors.second.constraint(
                equalTo: attribute.anchor.second,
                multiplier: attribute.multiplier,
                constant: attribute.constant.second
            )
        ]
    case .greaterThanOrEqual:
        return [
            anchors.first.constraint(
                greaterThanOrEqualTo: attribute.anchor.first,
                multiplier: attribute.multiplier,
                constant: attribute.constant.first
            ),
            anchors.second.constraint(
                greaterThanOrEqualTo: attribute.anchor.second,
                multiplier: attribute.multiplier,
                constant: attribute.constant.second
            )
        ]
    @unknown default:
        return []
    }
}

private func makeConstraints<Anchor>(
    attribute: PairAttribute<Anchor>,
    constraints: (Anchor, PairConstant) -> [NSLayoutConstraint]
) -> [NSLayoutConstraint] {
    constraints(attribute.anchor, attribute.constant).map {
        let constraint = $0.with(multiplier: attribute.multiplier)
        constraint.priority = attribute.priority
        return constraint.activate()
    }
}

private func makeConstraints(
    anchors: SizePair,
    attribute: PairAttribute<SizePair>,
    relation: NSLayoutConstraint.Relation
) -> [NSLayoutConstraint] {
    let constraints: [NSLayoutConstraint]
    if attribute.anchor.first is LayoutDimension {
        constraints = sizeConstraints(
            anchors: anchors,
            constant: attribute.constant,
            relation: relation
        )
    } else {
        constraints = sizeConstraints(anchors: anchors, attribute: attribute, relation: relation)
    }
    return constraints.map {
        $0.priority = attribute.priority
        return $0.activate()
    }
}
