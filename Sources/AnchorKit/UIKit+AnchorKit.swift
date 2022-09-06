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

import UIKit

public extension UIView {
    var horizontalAnchors: HorizontalPair {
        horizontalAnchors(.directional)
    }

    func horizontalAnchors(_ type: HorizontalAnchorsPair) -> HorizontalPair {
        switch type {
        case .absolute:
            return HorizontalPair(first: leftAnchor, second: rightAnchor)
        case .directional:
            return HorizontalPair(first: leadingAnchor, second: trailingAnchor)
        }
    }

    var verticalAnchors: VerticalPair {
        Pair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: CenterPair {
        Pair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: SizePair {
        Pair(first: widthAnchor, second: heightAnchor)
    }
}

public extension UILayoutGuide {
    var horizontalAnchors: HorizontalPair {
        horizontalAnchors(.directional)
    }

    func horizontalAnchors(_ type: HorizontalAnchorsPair) -> HorizontalPair {
        switch type {
        case .absolute:
            return HorizontalPair(first: leftAnchor, second: rightAnchor)
        case .directional:
            return HorizontalPair(first: leadingAnchor, second: trailingAnchor)
        }
    }

    var verticalAnchors: VerticalPair {
        Pair(first: topAnchor, second: bottomAnchor)
    }

    var centerAnchors: CenterPair {
        Pair(first: centerXAnchor, second: centerYAnchor)
    }

    var sizeAnchors: SizePair {
        Pair(first: widthAnchor, second: heightAnchor)
    }
}
