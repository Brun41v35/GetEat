//
//  Network.swift
//  GetEat
//
//  Created by Bruno Silva on 14/06/21.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class Network {
    
    //MARK: - Variables
    let valueUser: [String] = []
    
    //MARK: - Functions
    class func send(food: [String], onComplete: @escaping ([Food])->Void) {
        for foods in food {
            foods.replacingOccurrences(of: "\"", with: "")
            foods.replacingOccurrences(of: "[", with: "")
            foods.replacingOccurrences(of: "]", with: "")
            let basePath = "https://api-geteat.herokuapp.com/api/foods?ingredients=[%22\(foods)%22]"
            let semaphore = DispatchSemaphore (value: 0)
            var request = URLRequest(url: URL(string: basePath)!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwYzdkNjQ2ZTYwMzdiMDAxNWQ1NDgzZiIsImlhdCI6MTYyMzcwOTI2NSwiZXhwIjoxNjI0MzE0MDY1fQ.nW-WTLuol_podQF3NEhf9kwAfoQhPnwvVE-qeHrGJu8", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
              }
                do {
                    let response = try JSONDecoder().decode([Food].self, from: data)
                    onComplete(response)
                    print(String(data: data, encoding: .utf8)!)
                    semaphore.signal()
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
            semaphore.wait()
        }
    }
}
