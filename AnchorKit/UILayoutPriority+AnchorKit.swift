//
//  UILayoutPriority+AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public func * (lhs: UILayoutPriority, rhs: FloatRepresentable) -> UILayoutPriority {
    return UILayoutPriority(lhs.rawValue * rhs.float)
}

public func * (lhs: FloatRepresentable, rhs: UILayoutPriority) -> UILayoutPriority {
    return rhs * lhs
}

public func / (lhs: UILayoutPriority, rhs: FloatRepresentable) -> UILayoutPriority {
    return UILayoutPriority(lhs.rawValue / rhs.float)
}
