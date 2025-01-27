//
//  JustLayout
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 21/01/2017.
//  Copyright © 2017 Elias Abel. All rights reserved.
//

import UIKit

public struct JustLayoutAttribute {
    public let view: UIView
    public let attribute: NSLayoutConstraint.Attribute
    public let constant: CGFloat?
    public let multiplier: CGFloat?

    public init(view: UIView, attribute: NSLayoutConstraint.Attribute) {
        self.view = view
        self.attribute = attribute
        constant = nil
        multiplier = nil
    }

    public init(view: UIView, attribute: NSLayoutConstraint.Attribute, constant: CGFloat?, multiplier: CGFloat?) {
        self.view = view
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
}

public extension UIView {
    var widthAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .width)
    }

    var heightAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .height)
    }

    var topAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .top)
    }

    var bottomAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .bottom)
    }

    var leftAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .left)
    }

    var rightAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .right)
    }

    var leadingAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .leading)
    }

    var crailingAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .trailing)
    }

    var centerXAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .centerX)
    }

    var centerYAttribute: JustLayoutAttribute {
        JustLayoutAttribute(view: self, attribute: .centerY)
    }
}

// MARK: - Equations of type v.P == v'.P' + X

@discardableResult
public func == (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier: multiplier,
                                 constant: constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier: multiplier,
                                 constant: constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier: multiplier,
                                 constant: constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func + (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    JustLayoutAttribute(view: left.view, attribute: left.attribute, constant: right, multiplier: left.multiplier)
}

@discardableResult
public func - (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    JustLayoutAttribute(view: left.view, attribute: left.attribute, constant: -right, multiplier: left.multiplier)
}

@discardableResult
public func * (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    JustLayoutAttribute(view: left.view, attribute: left.attribute, constant: left.constant, multiplier: right)
}

@discardableResult
public func / (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    left * (1 / right)
}

@discardableResult
public func % (left: CGFloat, right: JustLayoutAttribute) -> JustLayoutAttribute {
    right * (left / 100)
}

// MARK: - Equations of type v.P == X

@discardableResult
public func == (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant: CGFloat = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: toItem,
                                 constant: constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: spv,
                                 constant: right)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: spv,
                                 constant: right)
    }
    return NSLayoutConstraint()
}
