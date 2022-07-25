//
//  UIKit+AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 02/11/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public extension UIEdgeInsets {

    init(_ value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }

    init(top: CGFloat, bottom: CGFloat) {
        self.init(top: top, left: 0, bottom: bottom, right: 0)
    }

    init(left: CGFloat, right: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: right)
    }

    static prefix func - (lhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(top: -lhs.top, left: -lhs.left, bottom: -lhs.bottom, right: -lhs.right)
    }
}

public extension UIOffset {

    init(_ value: CGFloat) {
        self.init(horizontal: value, vertical: value)
    }

    static prefix func - (lhs: UIOffset) -> UIOffset {
        UIOffset(horizontal: -lhs.horizontal, vertical: -lhs.vertical)
    }
}

public extension CGSize {

    init(_ value: CGFloat) {
        self.init(width: value, height: value)
    }

    static prefix func - (lhs: CGSize) -> CGSize {
        CGSize(width: -lhs.width, height: -lhs.height)
    }
}
