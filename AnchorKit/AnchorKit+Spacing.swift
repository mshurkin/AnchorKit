//
//  AnchorKit+Spacing.swift
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

public struct AnchorKitSpacing {
    let multiplier: CGFloat

    public static let systemSpacing = AnchorKitSpacing(multiplier: 1)
}
extension AnchorKitSpacing: AnchorKitConstant {}

public func * (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    AnchorKitSpacing(multiplier: lhs.multiplier * rhs.cgFloat)
}

public func * (lhs: FloatRepresentable, rhs: AnchorKitSpacing) -> AnchorKitSpacing {
    AnchorKitSpacing(multiplier: rhs.multiplier * lhs.cgFloat)
}

public func / (lhs: AnchorKitSpacing, rhs: FloatRepresentable) -> AnchorKitSpacing {
    AnchorKitSpacing(multiplier: lhs.multiplier / rhs.cgFloat)
}

public func + (
    lhs: NSLayoutXAxisAnchor,
    rhs: AnchorKitSpacing
) -> AnchorKitAttribute<NSLayoutXAxisAnchor, AnchorKitSpacing> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}

public func + (
    lhs: NSLayoutYAxisAnchor,
    rhs: AnchorKitSpacing
) -> AnchorKitAttribute<NSLayoutYAxisAnchor, AnchorKitSpacing> {
    AnchorKitAttribute(anchor: lhs, constant: rhs)
}
