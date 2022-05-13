//
//  AlertListCell.swift
//  TimeToTakeMedicine
//
//  Created by 이민지 on 2022/05/13.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    let userNorifiCation = UNUserNotificationCenter.current()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func alertSwitchValueChange(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "Alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "Alerts")
        
        if sender.isOn {
            userNorifiCation.addNotificationRequest(by: alerts[sender.tag])
            print("tag: \(sender.tag)")
        } else {
            userNorifiCation.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
        }
    }
}
