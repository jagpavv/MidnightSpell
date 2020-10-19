//
//  ViewController.swift
//  MidnightSpell
//
//  Created by Eunjin on 10/18/20.
//

import UIKit

class ViewController: UIViewController {

  var timer: Timer!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .yellow

    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runCountdown), userInfo: nil, repeats: true)
  }

  @objc func runCountdown() {

    let userCalendar = Calendar.current
    var dateComponent = DateComponents()
        dateComponent.day = 1

    let now = Date()
    let tomorrow = userCalendar.date(byAdding: dateComponent, to: now)!
    let tomorrowMidnight = userCalendar.startOfDay(for: tomorrow)

    let timeLeft = userCalendar.dateComponents([.hour, .minute, .second], from: now, to: tomorrowMidnight)

    print("hour:\(timeLeft.hour)) | min:\(timeLeft.minute) | sec: \(timeLeft.second)")
    RunLoop.current.add(timer, forMode: .common) // This for firing timer even there's UI interaction.

    let hours = timeLeft.hour!
    let minutes = timeLeft.minute!
    let seconds = timeLeft.second!

    let timeLeftString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    print("timeLeftString", timeLeftString)
  }
}
