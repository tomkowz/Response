import Foundation

public typealias JSONDictionary = [String: AnyObject]
public typealias JSONArray = [JSONDictionary]

extension Response {
    public var json: JSONDictionary? {
        guard let data = data else { return nil }
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                return json
            } else {
                print("Cannot convert response to json for \(self).")
                return nil
            }
            
        } catch let error {
            print("Error parsing json from response: \(self). Error: \(error).")
            return nil
        }
    }
    
    public var jsonArray: JSONArray? {
        guard let data = data else { return nil }
        do {
            if let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONArray {
                return jsonArray
            } else {
                print("Cannot convert response to json array for \(self).")
                return nil
            }
            
        } catch let error {
            print("Error parsing json array from response: \(self). Error: \(error).")
            return nil
        }
    }
}
