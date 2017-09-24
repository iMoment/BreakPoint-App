//
//  Message.swift
//  BreakPoint
//
//  Created by Stanley Pan on 24/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
}
