//
//  LoginDataModel.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/10.
//

import Foundation

struct LoginDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData?
    
    enum CodingKeys: String, CodingKey{
        case success
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData.self, forKey: .data)) ?? nil
    }
    
}


struct UserData: Codable {
    let userID: Int
    let userNickname, token: String
    
    enum CodingKeys: String, CodingKey{
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
