import UIKit
import Foundation

//MARK:-客戶的通訊協定
protocol clientele:class {
    func newspaper(value:String)
}

protocol Subject {
    func subscribe(clientele:clientele)
    func unsubscribe(clientele:clientele)
}
class SubjectBase: Subject {
    private var clienteles = [clientele]()
    
    func subscribe(clientele:clientele) {
        self.clienteles.append(clientele)
    }
    
    func unsubscribe(clientele:clientele) {
        self.clienteles = self.clienteles.filter{ $0 !== clientele }
    }
    
    func removeAllObservers() {
        self.clienteles.removeAll()
    }
    
    func sendNewspaper(value:String) {
        clienteles.forEach({$0.newspaper(value: value)})
    }
    
    
}

//MARK:-報社
class NewspaperAgency:SubjectBase{
    public static var sh = NewspaperAgency()
    
    func send() {
        sendNewspaper(value: "Have a good day")
    }
}

//MARK:-繼承客戶的人
class people:clientele{
    var peopleNum:Int
    init(num:Int) {
        self.peopleNum = num
    }
    func newspaper(value: String) {
        print("people \(peopleNum) : \(value)")
    }
    func subNewpaper() {
        NewspaperAgency.sh.subscribe(clientele: self)
    }
  

}

//MARK:-新增10個客人。只有偶數者可訂購報紙
var peoples:[people] = (1...10).map({ v in
    let p = people(num: v)
    if v % 2 == 0 {p.subNewpaper()}
    return p
})
//MARK:-發報
NewspaperAgency.sh.send()
