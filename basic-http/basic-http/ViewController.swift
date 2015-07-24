
import UIKit

func JSONStringify(value: AnyObject, pretty: Bool = false) -> String {
    var options = pretty ? NSJSONWritingOptions.PrettyPrinted : nil

    if NSJSONSerialization.isValidJSONObject(value) {
        if let data = NSJSONSerialization
            .dataWithJSONObject(value, options: options, error: nil) {
            if let str = NSString(data: data, encoding: NSUTF8StringEncoding) {
                return str as String
            }
        }
    }

    return ""
}

func httpRequest(req: NSMutableURLRequest, cb: (String, String) -> Void) {
    let session = NSURLSession.sharedSession()

    let task = session.dataTaskWithRequest(req, completionHandler: {
            data, response, error in

            if error != nil {
                cb((error!.localizedDescription) as String, "")
            } else {
                cb("", NSString(data: data!, encoding: NSUTF8StringEncoding) as! String)
            }
    })

    task.resume()
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // use NSURLSession

        // simple async GET
        let req1 = NSMutableURLRequest(URL: NSURL(string: "http://httpbin.org/get")!)

        httpRequest(req1) {
            (err: String, data: String) -> Void in
            if err != "" {
                print(err)
            } else {
                print(data)
            }
        }

        // simple async PUT
        let req2 = NSMutableURLRequest(URL: NSURL(string: "http://httpbin.org/put")!)
        req2.HTTPMethod = "PUT"
        req2.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonString = JSONStringify([
            "name": "haoxin"
        ])

        let data: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
        req2.HTTPBody = data

        httpRequest(req2) {
            (err: String, data: String) -> Void in
            if err != "" {
                print(err)
            } else {
                print(data)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

