
📌encode
```
import UIKit
import Alamofire

struct PersonDataModel : Encodable{
    var name : String
    var age : Int
}

class ViewController: UIViewController {
    
    let personData = PersonDataModel(name: "은영" ,age: 25);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do{
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        }catch{
            print(error)
        }
        
    
    }
}
```


📌decode
```
import UIKit
import Alamofire

struct CoffeeDataModel : Decodable{
    var drink : String
    var price : Int
    var orderer : String
    
    enum CodingKeys : String,CodingKey {
        case drink
        case price = "coffee_price"
        case orderer
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}
class ViewController: UIViewController {
    
    let dummyData = """
        {
         "drink" : "아메리카노",
         "coffee_price" : 1000,
         "orderer" : "은영"
        }
    """.data(using: .utf8)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        let jsonDecoder = JSONDecoder()
        
        do{
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("디코더성공")
            print(order)
        }catch{
            print(error)
        }
    
    }
}
```
📌Alamofire를 활용한 통신   
💡서버 통신 결과를 처리하기 위한 파일(ex. NetworkResult.swift)
```
enum NetWorkResult<T>{
    case success(T) //서버 통신 성공한 경우
    case requestErr(T) //요청 에러가 발생한 경우
    case pathErr  //경로 에러가 발생한 경우
    case serverErr  //서버의 내부적 에러가 발생한 경우
    case networkFail  //네트워크 연결이 실패한 경우
}
```
💡 데이터 모델을 만들기 위한 파일
‼️ Codable 데이터 모델을 도와주는 사이트 : https://app.quicktype.io/


💡

    
