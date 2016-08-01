
import Foundation

func JSONStringify(value: AnyObject, pretty: Bool = false) -> String {
    let options = pretty ?
        JSONSerialization.WritingOptions.prettyPrinted :
        JSONSerialization.WritingOptions(rawValue: 0)

    if JSONSerialization.isValidJSONObject(value) {
        if let data = try? JSONSerialization
            .data(withJSONObject: value, options: options) {
            if let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return str as String
            }
        }
    }

    return ""
}

func httpRequest(req: URLRequest, cb: (String, String) -> Void) {
    let task = URLSession.shared().dataTask(with: req as URLRequest) {
        data, response, error in

        if error != nil {
            cb((error!.localizedDescription) as String, "")
        } else {
            cb("", NSString(data: data!, encoding: String.Encoding.utf8) as! String)
        }
    }

    task.resume()
}


// use URLRequest

// simple async GET
let req1 = URLRequest(url: URL(string: "https://httpbin.org/get")!)

httpRequest(req: req1) {
    (err: String, data: String) -> Void in
        if err != "" {
            print(err, terminator: "")
        } else {
            print(data, terminator: "")
        }
    }

// simple async PUT
var req2 = URLRequest(url: URL(string: "https://httpbin.org/put")!)
req2.httpMethod = "PUT"
req2.addValue("application/json", forHTTPHeaderField: "Content-Type")

let jsonString = JSONStringify(value: [
    "name": "haoxin"
])

let data: Data = jsonString.data(using: String.Encoding.utf8)!
req2.httpBody = data

httpRequest(req: req2) {
    (err: String, data: String) -> Void in
    if err != "" {
        print(err, terminator: "")
    } else {
        print(data, terminator: "")
    }
}

sleep(5)
