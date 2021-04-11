//
//  EventModel.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 09/04/2021.
//

import UIKit

struct Event: Decodable {
    let data: [EventData]
}
struct EventData: Decodable {
    var caption, title, description, imageUrl, shareLink : String?
    var createdAt : Int?
}

