//
//  FloatRepresentable.swift
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

public protocol FloatRepresentable {

    var float: Float { get }
    var cgFloat: CGFloat { get }
}

// MARK: -

extension CGFloat: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        self
    }
}

extension Double: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Float: FloatRepresentable {

    public var float: Float {
        self
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Float80: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension UInt: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension UInt8: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension UInt16: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension UInt32: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension UInt64: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Int: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Int8: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Int16: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Int32: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension Int64: FloatRepresentable {

    public var float: Float {
        Float(self)
    }

    public var cgFloat: CGFloat {
        CGFloat(self)
    }
}

extension NSNumber: FloatRepresentable {

    public var float: Float {
        floatValue
    }

    public var cgFloat: CGFloat {
        CGFloat(floatValue)
    }
}
