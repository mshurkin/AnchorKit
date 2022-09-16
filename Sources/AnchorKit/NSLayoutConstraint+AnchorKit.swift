//
//  NSLayoutConstraint+AnchorKit.swift
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

extension NSLayoutConstraint {
    func apply(attribute: LayoutAttribute?) -> NSLayoutConstraint {
        guard let attribute = attribute else {
            return self
        }

        let hasChanges = attribute.multiplier != multiplier
        let multiplier = hasChanges ? attribute.multiplier : multiplier

        let constraint: NSLayoutConstraint
        if secondItem != nil, constant < 0, let relation = relation.inverted {
            constraint = NSLayoutConstraint(
                item: secondItem as Any,
                attribute: secondAttribute,
                relatedBy: relation,
                toItem: firstItem,
                attribute: firstAttribute,
                multiplier: 1 / multiplier,
                constant: -constant / multiplier
            )
        } else if hasChanges {
            constraint = NSLayoutConstraint(
                item: firstItem as Any,
                attribute: firstAttribute,
                relatedBy: relation,
                toItem: secondItem,
                attribute: secondAttribute,
                multiplier: multiplier,
                constant: constant
            )
        } else {
            constraint = self
        }

        if constraint.priority != attribute.priority {
            constraint.priority = attribute.priority
        }

        return constraint
    }

    @discardableResult
    func activate() -> NSLayoutConstraint {
        switch (firstItem, secondItem) {
        case let (lhs, rhs as UIView) where !(lhs is UIView):
            rhs.translatesAutoresizingMaskIntoConstraints = false
        case let (lhs as UIView, rhs as UIView) where rhs.isDescendant(of: lhs):
            rhs.translatesAutoresizingMaskIntoConstraints = false
        default:
            (firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
        isActive = true
        return self
    }
}
