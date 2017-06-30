Just a tiny class to carry a network response. (Swift 2.3, Swift 3.0)

```swift
public class HTTPResponse {
    public var urlResponse: NSURLResponse?
    public var data: NSData?
    public var error: NSError?
    
    public init() {}
}
```

It has two default extensions, one to get a json object out of data, and one to get array of json objects.
You can easily extend the class to give you type you want.

```swift
struct UserItem {
    let username: String
    let email: String
    let age: Int
}

extension UserItem {
    init?(dictionary: JSONDictionary) {
        let username = json["username"] as? String
        let email = json["email"] as? String
        let age = json["age"] as? Int

        if let username = username, let email = email, let age = age {
            self.username = username
            self.email = email
            self.age = age
        } else {
            return nil
        }
    }
}

extension HTTPResponse {
    var userItem: UserItem! {
        return json.flatMap(UserItem.init)
    }
}
```

You do network stuff as usual, you get `NSURLResponse`, `NSData` and `NSError` objects that you pass to `HTTPResponse` object.
When you want to get `UserItem` out of the response you just call `userItem` property and get what you need. You can throw and error, return optional or whatever.
