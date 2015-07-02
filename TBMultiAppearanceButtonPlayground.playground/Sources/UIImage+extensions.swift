import UIKit

public extension UIImage {
  class func imageWithColor(color: UIColor) -> UIImage {
    
    let rect = CGRectMake(0, 0, 1, 1)
    
    UIGraphicsBeginImageContext(rect.size)
    defer { UIGraphicsEndImageContext() }
    
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    
    return UIGraphicsGetImageFromCurrentImageContext()
  }
}

