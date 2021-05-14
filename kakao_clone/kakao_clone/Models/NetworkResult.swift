//
//  NetworkResult.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/10.
//
import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
