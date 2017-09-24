//
//  FeedVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 21/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var feedTableView: UITableView!
    
    //  MARK: Variables
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.retrieveFeedMessages { (returnedMessages) in
            self.messageArray = returnedMessages
            self.feedTableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        cell.configureCell(profileImage: image!, email: message.senderID, content: message.content)
        
        return cell
    }
}

extension FeedVC: UITableViewDelegate {
    
}











