//
//  TableViewDataSource.swift
//  FriendZone
//
//  Created by Shubhamay Das on 21/04/22.
//  Copyright © 2022 Hacking with Swift. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    var friends = [Friend]()
    
    override init() {
        super.init()
        loadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = friend.timeZone
        dateFormatter.timeStyle = .short
        
        cell.detailTextLabel?.text = dateFormatter.string(from: Date())
        return cell
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        
        guard let savedData = defaults.data(forKey: "Friends") else {
            return
        }
        
        guard let savedFriends = try? decoder.decode([Friend].self, from: savedData) else {
            return
        }
        
        friends = savedFriends
    }
    
    
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        guard let savedData = try? encoder.encode(friends) else {
            return
        }
        
        defaults.set(savedData, forKey: "Friends")
    }
    
}
