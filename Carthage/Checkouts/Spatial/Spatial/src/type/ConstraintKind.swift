#if os(iOS)
import UIKit
/**
 * UIView's that implement this protocol are able to store the anchor and size constraints
 * Note: Storing Constraints is a must if you want to change the constraints at a later point in time
 */
public protocol ConstraintKind:class{
   var anchor:AnchorConstraint? {get set}
   var size:SizeConstraint? {get set}
}
#endif
