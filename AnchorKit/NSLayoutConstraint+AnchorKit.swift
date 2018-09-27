//
//  NSLayoutConstraint+AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

extension NSLayoutConstraint {

    func with(multiplier: CGFloat) -> NSLayoutConstraint {
        guard multiplier != self.multiplier, let firstItem = firstItem else {
            return self
        }

        return NSLayoutConstraint(item: firstItem,
                                  attribute: firstAttribute,
                                  relatedBy: relation,
                                  toItem: secondItem,
                                  attribute: secondAttribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }

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
