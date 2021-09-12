//
//  TSCalendarWeekCell.swift
//  TSCalendar
//
//  Created by TAE SU LEE on 2018. 4. 17..
//

import UIKit

class TSCalendarWeekCell: UICollectionViewCell {
    weak var lblWeekOfYear: UILabel!
    var lblWeekOfYearWidthConstraint: NSLayoutConstraint!
    weak var weekView: TSCalendarWeekView!
    
    private weak var seperator: UIView!
    
    private let SUBVIEW_TAG = 1225
    private let constraint = TSCalendarConstraints()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        prepareSeperator()
        prepareWeekOfYear()
        prepareWeekView()
    }
    
    private func prepareSeperator() {
        let view = UIView()
        view.tag = SUBVIEW_TAG
        view.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        constraint.addSubview(view, toItem: self)
        self.seperator = view
        constraint.attributes(item: view, toItem: self, types: [.top, .leading, .trailing])
        constraint.height(parent: self, item: view, constant: 1)
    }
    
    private func prepareWeekOfYear() {
        let lblWeekOfYear = UILabel()
        lblWeekOfYear.tag = SUBVIEW_TAG
        lblWeekOfYear.text = "10"
        constraint.addSubview(lblWeekOfYear, toItem: self)
        self.lblWeekOfYear = lblWeekOfYear
        
//        constraint.attributes(item: lblWeekOfYear, toItem: self, types: [.top, .bottom, .leading])
        constraint.attributes(item: lblWeekOfYear, toItem: self, types: [.bottom, .leading])
        constraint.bottomTop(parent: self, item: lblWeekOfYear, toItem: seperator)
        lblWeekOfYearWidthConstraint = constraint.width(parent: self, item: lblWeekOfYear, constant: 30)
    }
    
    private func prepareWeekView() {
        let weekView = TSCalendarWeekView()
        weekView.tag = SUBVIEW_TAG
        constraint.addSubview(weekView, toItem: self)
        self.weekView = weekView
        
//        constraint.attributes(item: weekView, toItem: self, types: [.top, .bottom, .trailing])
        constraint.attributes(item: weekView, toItem: self, types: [.bottom, .trailing])
        constraint.bottomTop(parent: self, item: weekView, toItem: seperator)
        constraint.trailingLeading(parent: self, item: weekView, toItem: lblWeekOfYear)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        for dayView in weekView.dayViews {
            dayView.backgroundColor = UIColor.clear
            dayView.isSelected = false
            dayView.isToday = false
            dayView.isHoliday = false
            dayView.topRightText = nil
            dayView.reset()
        }
        weekView.reset()
    }
    
    // MARK: - override
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // "설정 > 손쉬운 사용 > 키보드 > 전체 키보드 접근" ON 되어 있을 경우 cell위에 view가 추가되 터치가 안되는 이슈로 직접 추가하지 않은 뷰는 제거되도록 처리
        if subviews.count > 3 {
            subviews.forEach { subview in
                if subview.tag == SUBVIEW_TAG {
                    subview.removeFromSuperview()
                }
            }
        }
    }
}
