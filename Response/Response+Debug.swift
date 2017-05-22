import Foundation

extension Response: CustomDebugStringConvertible {
    public var debugDescription: String {
        var result = "<Response>\n"
        if let urlResponse = urlResponse {
            result += "urlResponse: \(urlResponse)\n"
        } else {
            result += "urlResponse: nil\n"
        }
        
        if let data = data {
            result += "data: \(data.debugDescription)\n"
        } else {
            result += "data: nil\n"
        }
        
        if let error = error {
            result += "error: \(error)\n"
        } else {
            result += "error: nil\n"
        }
        
        return result
    }
}
