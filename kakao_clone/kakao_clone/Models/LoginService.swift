//
//  LoginService.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/10.
//

import Foundation
import Alamofire

struct LoginService{
    static let shared = LoginService()
    
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password]
    }
    
    func login(email : String , password : String, completion : @escaping (NetworkResult<Any>)->Void){
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signupURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result{
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
            
            }
        }
    }
        
        private func judgeStatus(by statuscode: Int, _ data: Data) -> NetworkResult<Any>{
            
            let decoder = JSONDecoder()
            
            guard let decodeData = try? decoder.decode(SignUpDataModel.self,from: data)
            else { return .pathErr}
            
            switch statuscode {
            case 200: return .success(decodeData.message)
            case 400: return .requestErr(decodeData.message)
            case 500: return .serverErr
            default: return .networkFail
                
            }
        }
        
    }
    
    
    
    
    
    
    




