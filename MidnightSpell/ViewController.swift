//
//  ViewController.swift
//  MidnightSpell
//
//  Created by Eunjin on 10/18/20.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var countdownLabel: UILabel!

  var timer: Timer!

  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    RunLoop.current.add(timer, forMode: .common) // This for firing timer even there's UI interaction.

    countdownLabel.text = String(format: "%02d : %02d : %02d", timeLeft.hour!, timeLeft.minute!, timeLeft.second!)
  }
}
