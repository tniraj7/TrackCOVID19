import Foundation

class WebService {
    
    private var WEB_SERVICE_URL = "https://covidtracking.com/api/v1/states/current.json"
    
    func getCOVIDTrackingResult(completion: @escaping ([Tracking]?) -> (Void)) {
        
        guard let url = URL(string: WEB_SERVICE_URL) else  { fatalError("Invalid url") }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let res = response as? HTTPURLResponse, res.statusCode == 200, error == nil else { return completion(nil) }
            
            do {
                let trackingList = try JSONDecoder().decode([Tracking].self, from: data)
                completion(trackingList)
            } catch  {
                fatalError(error as! String)
            }
        }
    }
}
