//
//  UIKit+AnchorKit.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 02/11/2018.
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
