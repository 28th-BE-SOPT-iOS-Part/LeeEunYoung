:star2: 서버와 클라이언트는 'HTTP 프로토콜' 방식으로 요청(Request)과 응답(Response)을 주고받음.

 ​	:pushpin: 클라이언트가 서버에게 'HTTP 프로토콜' 방식으로 요청할때는 다음과 같은 여러가지 메서드가 있음, 서버는 클라이언트가 요청한 메서드 방식에 맞춰서 Response를 클라이언트에게 전달함

 ​	:pushpin: GET: 데이터를 얻고 싶을 때

 ​	:pushpin: POST: 내용을 전송할 때

 ​	:pushpin: HEAD: 헤더 정보를 얻고 싶을 때 요청

 ​	:pushpin: PUT: 내용을 갱신하고 싶을 때

 ​	:pushpin: DELETE: 내용을 삭제하고 싶을 때

:star2: 예를 들면, 클라이언트가 서버에게로 해당 url를 통해 get 요청을 하면, json형태로 데이터를 받는 네트워크 방식

----------------------------------------------------

:star2: Decode 방식 : 서버에서 받은 Json형식의 데이터를 원하는 데이터 모델로 변환하는 과정

 ​	:pushpin: JSON을 decode 해서 데이터 모델로 만들려면 Decodable이라는 프로토콜을 채택해야 함

 ​		```struct 데이터 모델 : Decodable ```

 ​	:pushpin: JSON형식을 decode하는 예시 코드
```
import UIKit
import Alamofire

struct CoffeeDataModel : Decodable{
    var drink : String
    var price : Int
    var orderer : String
 ```
 
 
 ```
    
    enum CodingKeys : String,CodingKey {
        case drink
        case price = "coffee_price"
        case orderer
    }
 ```
 
 ```
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}
```
👉 coffeeDataModel이라는 구조체 데이터 모델이 Decodable프로토콜을 채택하도록 한다(이 데이터 모델은 다른 데이터에서부터 이 데이터 모델로 디코딩이 가하다는 뜻)
```
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
👉 원래는 서버에서 받은 JSON형식의 데이터를 사용하지만 이번에는 따옴표 3개를 작성하여 여러줄의 문자열을 작성하여 JSON형태로 만들어서 사용함(let dummyData) / JSONDecoder를 하나 선언함(let jsonDecoder = JSONDecoder()) / 그 다음 jsonDecoder에서 decode를 try한다(데이터 형과 어떤 데이터를 decode할지 넣음), try시에 에러가 발생한다면 catch로 가고 성공시에는 do{}의 다음 코드가 실행됨

-------------------------------------------------------------
:star2: Encode 방식 : 데이터 모델을 Encode해서 서버에서 받을 수 있는 JSON으로 넘길때 사용하는 방식
:pushpin: 데이터모델을 Encode해서 JSON으로 넘기려면, Encodable이라는 프로토콜을 채택해야 함

​		```struct 데이터 모델 : Encodable ```
📌 데이터를 JSON형식으로 encode하는 예시 코드

```
import UIKit
import Alamofire

struct PersonDataModel : Encodable{
    var name : String
    var age : Int
}
```
👉 PersonDataModel 구조체에 Encodable을 채택함( 이 데이터 모델은 다른 데이터로 인코딩이 가능)
```
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
👉 PersonDataModel 데이터를 선언함(let personData),JSONEncoder 인스턴스를 하나 선언함, personData를 encode해보고 성공한 경우에는 data에 저장해서 print하고 에러가 발생한 경우는 catch로

-------------------------------------------

:star2: 앞의 Encodable과 Decodable을 동시에 묶어서 Codable이라는 프로토콜을 사용함.

​		```

​		struct CoffeeDataModel : Codable {

​			var drink : String

​			var price : Int

​			var orderer : String

​		}

​		```
-----------------------------------------------------------
🌟 Alamofire를 활용한 통신 










  
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

    
