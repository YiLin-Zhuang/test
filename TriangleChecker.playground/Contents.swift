import UIKit
////MARK:-三角形的類型
enum TriangleType:String{
    case regular = "正三角形"
    case isosceles = "等腰三角形"
    case right = "直角三角形"
    case other = "其他三角形"
    case error = "錯誤"
}

//MARK:-三角形模型
class TriangleModel{
    let first:Int,second:Int,third:Int
    init(first:Int = 0,second:Int = 0,third:Int = 0) {
        self.first = first
        self.second = second
        self.third = third
    }
    func toSet() -> Set<Int> {return Set([first,second,third])}
}
//MARK:-三角形檢查器
class Checker{
    private var _Triangle:TriangleModel = TriangleModel()
    
    var Triangle:TriangleModel{
        get{
            return _Triangle
        }
        set{
            _Triangle = TriangleModel(first: newValue.first, second: newValue.second, third: newValue.third)
        }
    }
    func Result() -> TriangleType {
        return TriangleType.other
    }
}
//MARK:-角度檢查
class CheckerAngle:Checker {
    override func Result() -> TriangleType {
        //檢查是否為三角形
        if Triangle.first + Triangle.second + Triangle.third != 180 {return TriangleType.error}
        
        //轉成Set(不會有重複的值)
        switch Triangle.toSet().count {
        case 1:return TriangleType.regular
        //count = 1 代表3個角度都一樣 故等於正三角形
        case 2:return TriangleType.isosceles
        //count = 2 代表其中兩個角度相同 故等於等腰三角形
        case 3:return Triangle.toSet().contains(90) ? TriangleType.right : TriangleType.other
        //count = 3 代表沒有相同角度 然後檢查有無90度角 有的話為 直角三角形
        default:return TriangleType.error
        }
    }
}
//MARK:-三角形檢查器工廠
class CheckerFactory:Checker {
    class func CreateChecker() -> Checker{return CheckerAngle()}
}


//MARK:-使用
let checker = CheckerFactory.CreateChecker()
//先創建一個檢查器
checker.Triangle = TriangleModel(first: 60, second: 60, third: 60)
//再將（角度為60,60,60）的三角形輸入到檢查器
checker.Result().rawValue
//得出什麼類型的三角形
