//
//  SignUpDataModel.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/14.
//

import Foundation


struct SignUpDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData2?
    
    enum CodingKeys: String, CodingKey{
        case success
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData2.self, forKey: .data)) ?? nil
    }
    
}


struct UserData2: Codable {
    let email, password, sex, nickname: String
    let phone, birth: String
    
    enum CodingKeys: String, CodingKey{
        case email
        case password
        case sex
        case nickname
        case phone
        case birth
    }
}
