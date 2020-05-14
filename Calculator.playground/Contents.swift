import UIKit

import Foundation
//MARK:-四則運算型別
enum method{
    case add,sub,mul,div
}
//MARK:-運作方式
class Operation {
    private var _firstNumber = 0
    private var _secondNumber = 0
    
    var firstNumber: Int{
        get{
            return _firstNumber
            
        }
        set{ _firstNumber = newValue
            
        }
    }

    var secondNumber: Int{
        get{
            return _secondNumber
        }
        set{
            _secondNumber = newValue
        }
    }
    
    func Result() -> Int {
        return 0
    }
}


//MARK:-四則運算
class Additon:Operation {
    //加法
    override func Result() -> Int { return firstNumber + secondNumber }
}
class Substraction:Operation {
    //減法
    override func Result() -> Int { return firstNumber - secondNumber }
}
class Multiplied:Operation {
    //乘法
    override func Result() -> Int { return firstNumber * secondNumber }
}
class Division:Operation {
    //除法
    override func Result() -> Int { return firstNumber / secondNumber }
}


//MARK:-運作方式工廠
class OperationFactory:Operation {
    class func CreateOperation(method:method) -> Operation{
        switch method {
        case .add:
            return Additon()
        case .sub:
            return Substraction()
        case .mul:
            return Multiplied()
        case .div:
            return Division()
        }
    }
}
//MARK:-使用
var operation = OperationFactory.CreateOperation(method: .add)
//創建一個加法的物件
operation.firstNumber = 50
//數入第一個數字
operation.secondNumber = 40
//數入第二個數字
operation.Result()
//查看結果
