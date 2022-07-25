//
//  FloatRepresentable.swift
//  AnchorKit
//
//  Created by Максим Шуркин on 27/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
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
