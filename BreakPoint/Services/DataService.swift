//
//  DataService.swift
//  BreakPoint
//
//  Created by Stanley Pan on 21/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDatabaseUser(uid: String, userData: [String: Any]) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func insertPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, insertComplete: @escaping CompletionHandler) {
        if groupKey != nil {
            //  TODO: Send to group reference
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            insertComplete(true)
        }
    }
}




















