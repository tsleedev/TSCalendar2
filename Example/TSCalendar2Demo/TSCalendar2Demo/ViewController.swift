//
//  ViewController.swift
//  TSCalendar
//
//  Created by TAE SU LEE on 09/27/2018.
//

import UIKit
import TSCalendar2

class ViewController: UIViewController {
    @IBOutlet private weak var calendar: TSCalendar!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private let taskStart: Date = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: "2021-09-20")!
    }()
    private let taskEnd: Date = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: "2021-09-22")!
    }()
    
    private let oneDay: Date = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: "2021-09-15")!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
    }
}

// MARK: - Helper
private extension ViewController {
    func setupCalendar() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let minimumDate = formatter.date(from: "1900-01-01")!
        let maximumDate = formatter.date(from: "2050-12-31")!
        
        if #available(iOS 13.0, *) {
            calendar.backgroundColor = UIColor.systemBackground
        } else {
            calendar.backgroundColor = UIColor.white
        }
        calendar.minimumDate(minimumDate)
        calendar.maximumDate(maximumDate)
        calendar.firstWeekday(.sunday)
        
        calendar.customToday = formatter.date(from: "2021-09-09")!
        calendar.todayType(.circle)
        calendar.selectedType(.circle)
        
        calendar.locale(Locale(identifier: "en_US"))
        
        calendar.dataSource = self
        calendar.delegate = self
        let appearance = TSCalendarAppearance.shared
        appearance.font.weekdayHeader = UIFont.systemFont(ofSize: 9, weight: .bold)
        appearance.font.days = UIFont.systemFont(ofSize: 12, weight: .bold)
        appearance.font.topRight = UIFont.systemFont(ofSize: 8, weight: .regular)
        appearance.size.circleRadius = 10
        if #available(iOS 13.0, *) {
            appearance.color.text.weekdayHeader = UIColor.label
            appearance.color.text.weekday = UIColor.label
            appearance.color.seperator = UIColor.quaternaryLabel
        }
    }
}

// MARK: - IBAction
private extension ViewController {
    @IBAction func clickToday(_ sender: Any) {
        calendar.today(animated: true)
    }
}

// MARK: - TSCalendarDataSource
extension ViewController: TSCalendarDataSource {
    func calendar(_ calendar: TSCalendar, weekWillDisplay weekView: TSCalendarWeekView) {
        drawTask(weekView: weekView)
    }
    
    func calendar(_ calendar: TSCalendar, dayWillDisplay dayView: TSCalendarDayView) {
        drawDay(dayView: dayView)
    }
}

// MARK: - TSCalendarDelegate
extension ViewController: TSCalendarDelegate {
    func calendar(_ calendar: TSCalendar, pageWillChange date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM"
        titleLabel.text = dateFormatter.string(from: date)
    }
    
    func calendar(_ calendar: TSCalendar, pageDidChange date: Date) {
        
    }
    
    func calendar(_ calendar: TSCalendar, focusDidChange date: Date) {
        
    }
    
    func calendar(_ calendar: TSCalendar, didSelect date: Date) {
        
    }
}

// MARK: - Example draw line
private extension ViewController {
    func drawTask(weekView: TSCalendarWeekView) {
        guard let startDate = weekView.startDate(), let endDate = weekView.endDate() else { return }
        let fromDate = taskStart
        let toDate = taskEnd
        
        var start = startDate
        var end = endDate
        if start < fromDate {
            start = fromDate
        }
        if toDate < end {
            end = toDate
        }
        
        if let minDayView = weekView.dayView(date: start), let maxDayView = weekView.dayView(date: end) {
            let lineTaskView = LineTaskView()
            lineTaskView.title = "Chuseok, Korean Thanksgiving Day"
            weekView.insert(lineTaskView, aboveSubview: weekView.dayViews.last!)
            lineTaskView.translatesAutoresizingMaskIntoConstraints = false
            if let superview = weekView.superview {
                lineTaskView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 30).isActive = true
                lineTaskView.leftAnchor.constraint(equalTo: minDayView.leftAnchor, constant: 0).isActive = true
                lineTaskView.rightAnchor.constraint(equalTo: maxDayView.rightAnchor, constant: 0).isActive = true
                lineTaskView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            }
        }
    }
    
    func drawDay(dayView: TSCalendarDayView) {
        if Calendar.current.isDate(dayView.date, inSameDayAs: oneDay) {
            if #available(iOS 13.0, *) {
                let image = UIImage(systemName: "star")
                let imageView = UIImageView(image: image)
                dayView.addIcons([imageView])
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
