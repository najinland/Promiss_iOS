//
//  SignUpResult.swift
//  Promiss_iOS
//
//  Created by 임수현 on 17/10/2019.
//  Copyright © 2019 Anna Lee. All rights reserved.
//

import Foundation

struct UserResult: Codable {
    let result: Int
    let message: String?
    let data: UserData?
}

struct SearchUserResult: Codable {
    let result: Int
    let message: String?
    let data: [UserData?]
}

struct UserData: Codable {
    let id: Int
    let user_name: String
    let user_pw: String
    var appointment_id: Int?
    let last_date: String
}
