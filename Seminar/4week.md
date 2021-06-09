
💡encode
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


💡decode
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
    
