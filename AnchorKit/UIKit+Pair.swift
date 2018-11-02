//
//  UIKit+Pair.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 29/10/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

public extension UIView {

    var horizontalAnchors: AnchorKitHorizontalPair {
        return AnchorKitPair(first: leadingAnchor, second: trailingAnchor)
    }

    var verticalAnchors: AnchorKitVerticalPair {
        return AnchorKitPair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: AnchorKitCenterPair {
        return AnchorKitPair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: AnchorKitSizePair {
        return AnchorKitPair(first: widthAnchor, second: heightAnchor)
    }
}

public extension UILayoutGuide {

    var horizontalAnchors: AnchorKitHorizontalPair {
        return AnchorKitPair(first: leadingAnchor, second: trailingAnchor)
    }

    var verticalAnchors: AnchorKitVerticalPair {
        return AnchorKitPair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: AnchorKitCenterPair {
        return AnchorKitPair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: AnchorKitSizePair {
        return AnchorKitPair(first: widthAnchor, second: heightAnchor)
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
