//
//  UIKit+Pair.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 29/10/2018.
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

public extension UIView {

    var horizontalAnchors: AnchorKitHorizontalPair {
        AnchorKitPair(first: leadingAnchor, second: trailingAnchor)
    }

    var verticalAnchors: AnchorKitVerticalPair {
        AnchorKitPair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: AnchorKitCenterPair {
        AnchorKitPair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: AnchorKitSizePair {
        AnchorKitPair(first: widthAnchor, second: heightAnchor)
    }
}

public extension UILayoutGuide {

    var horizontalAnchors: AnchorKitHorizontalPair {
        AnchorKitPair(first: leadingAnchor, second: trailingAnchor)
    }

    var verticalAnchors: AnchorKitVerticalPair {
        AnchorKitPair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: AnchorKitCenterPair {
        AnchorKitPair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: AnchorKitSizePair {
        AnchorKitPair(first: widthAnchor, second: heightAnchor)
    }
}

extension UIEdgeInsets: AnchorKitPairConstant {

    public static func += (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top += rhs.top
        lhs.left += rhs.left
        lhs.right += rhs.right
        lhs.bottom += rhs.bottom
    }

    public static func += (lhs: inout UIEdgeInsets, rhs: CGFloat) {
        lhs.top += rhs
        lhs.left += rhs
        lhs.bottom += rhs
        lhs.right += rhs
    }

    public static func -= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs.top -= rhs.top
        lhs.left -= rhs.left
        lhs.right -= rhs.right
        lhs.bottom -= rhs.bottom
    }

    public static func -= (lhs: inout UIEdgeInsets, rhs: CGFloat) {
        lhs.top -= rhs
        lhs.left -= rhs
        lhs.bottom -= rhs
        lhs.right -= rhs
    }
}

extension UIOffset: AnchorKitPairConstant {

    public static func += (lhs: inout UIOffset, rhs: UIOffset) {
        lhs.horizontal += rhs.horizontal
        lhs.vertical += rhs.vertical
    }

    public static func += (lhs: inout UIOffset, rhs: CGFloat) {
        lhs.horizontal += rhs
        lhs.vertical += rhs
    }

    public static func -= (lhs: inout UIOffset, rhs: UIOffset) {
        lhs.horizontal -= rhs.horizontal
        lhs.vertical -= rhs.vertical
    }

    public static func -= (lhs: inout UIOffset, rhs: CGFloat) {
        lhs.horizontal -= rhs
        lhs.vertical -= rhs
    }
}

extension CGSize: AnchorKitPairConstant {

    public static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }

    public static func += (lhs: inout CGSize, rhs: CGFloat) {
        lhs.width += rhs
        lhs.height += rhs
    }

    public static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }

    public static func -= (lhs: inout CGSize, rhs: CGFloat) {
        lhs.width -= rhs
        lhs.height -= rhs
    }
}
