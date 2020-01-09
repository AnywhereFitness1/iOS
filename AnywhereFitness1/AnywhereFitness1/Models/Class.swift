//
//  Class.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import Foundation

struct Class: Codable {
    var name: String
    var type: String
    var Start: Date
    var Duration: String
    var Level: String
    var Location: String
    var Attendees: Int
    var Max: Int
}
