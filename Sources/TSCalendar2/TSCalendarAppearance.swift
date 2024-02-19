//
//  TSCalendarAppearance.swift
//  TSCalendar
//
//  Created by TAE SU LEE on 2018. 4. 23..
//

import UIKit

public class TSCalendarAppearance: NSObject {
    public static let shared = TSCalendarAppearance()
    
    public let color = Color()
    public let font = Font()
    public let size = Size()
    public var weekOfYear: Bool = false
    public var weekOfYearWidth: CGFloat = 30
    
    public class Color {
        public let text = Text()
        public let bg = Background()
        public var seperator = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        
        public class Text: NSObject {
            public var weekdayHeader: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
            public var sunday: UIColor = UIColor(red: 252/255, green: 79/255, blue: 78/255, alpha: 1)
            public var saturday: UIColor = UIColor(red: 74/255, green: 138/255, blue: 243/255, alpha: 1)
            public var weekday: UIColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
            public var selectedDate: UIColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
            public var topRight: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
            public var iconText: UIColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
            
            public let today = Today()
            public class Today: NSObject {
                public let circle = Circle()
                public let rectangle = Rectangle()
                
                public class Circle: NSObject {
                    public var sunday: UIColor = UIColor.white
                    public var saturday: UIColor = UIColor.white
                    public var weekday: UIColor = UIColor.white
                }
                
                public class Rectangle: NSObject {
                    public var sunday: UIColor = UIColor(red: 252/255, green: 79/255, blue: 78/255, alpha: 1)
                    public var saturday: UIColor = UIColor(red: 74/255, green: 138/255, blue: 243/255, alpha: 1)
                    public var weekday: UIColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                }
            }
        }
        
        public class Background: NSObject {
            public let today = Today()
            
            public class Today: NSObject {
                public let circle = Circle()
                public let rectangle = Rectangle()
                
                public class Circle: NSObject {
                    public var sunday: UIColor = UIColor(red: 253/255, green: 107/255, blue: 106/255, alpha: 1)
                    public var saturday: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
                    public var weekday: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
                }
                
                public class Rectangle: NSObject {
                    public var sunday: UIColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
                    public var saturday: UIColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
                    public var weekday: UIColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
                }
            }
        }
    }
    
    public class Font: NSObject {
        public var weekdayHeader: UIFont = UIFont.boldSystemFont(ofSize: 12)
        public var days: UIFont = UIFont.boldSystemFont(ofSize: 12)
        public var topRight: UIFont = UIFont.systemFont(ofSize: 8)
        public var iconText: UIFont = UIFont.systemFont(ofSize: 7)
    }
    
    public class Size: NSObject {
        public var circleRadius: CGFloat = 10
    }
}
