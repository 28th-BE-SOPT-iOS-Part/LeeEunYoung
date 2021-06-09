
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
💡서버 통신 결과를 처리하기 위한 파일(ex. NetworkResult.swift) : 네트워크 결과를 나누기 위해서 enum형으로 선언
```
enum NetWorkResult<T>{
    case success(T) //서버 통신 성공한 경우
    case requestErr(T) //요청 에러가 발생한 경우
    case pathErr  //경로 에러가 발생한 경우
    case serverErr  //서버의 내부적 에러가 발생한 경우
    case networkFail  //네트워크 연결이 실패한 경우
}
```
💡 데이터 모델을 만들기 위한 파일(ex. PersonDataModel.swift) : 서버에서 받아온 JSON형태의 데이터를 담아내기 위해서 데이터 구조체를 만들고 codable을 채택  

⭐https://app.quicktype.io/
```
struct PersonDataModel: Codable{
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

struct Person: Codable {
    let name, profileMessage: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case profileMessage = "profile_message"
    }

}
```

💡 실직적인 네트워크 처리를 하는 파일(ex. GetPersonDataService.swift) : escaping closure를 활용해 결과값을 viewcontroller에 전달
```
struct GetPersonDataService
{
    static let shared = GetPersonDataService() //싱글턴 패턴을 선언 - 다른 뷰컨에서도 접근 가능함
    
    func getPersonInfo(completion : @escaping (NetworkResult<T>) -> Void)
    {
        let URL = "데이터를 받아오려는 주소 넣기"
        let header : HTTPHeaders = ["Content-Type":"application/json"]
    
        let dataRequest = AF.request(URL, method: .get, encoding: JSONEncoding.default, headers:header)
    
        dataRequest.responseData { dataResponse in
        
        switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.pathErr)
        }
        }
    }

    private func judgeStatus
    
    
    
    
    
    
    
    
    private func isValidData














}
```

    
