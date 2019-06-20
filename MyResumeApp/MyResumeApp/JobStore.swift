//
//  JobStore.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/19/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit
import CoreData

typealias JobsResult = Result<[Job],Error>

enum JobsError: Error {
    case invalidJSONData
}//enum JobsError

class JobStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private let persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Employment")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                print("Error set up core data \(error)")
            }
        })
        return container
    }()
    
    private func processJobsRequest(data: Data?, error: Error?) -> JobsResult {
        guard let data = data else {
            return .failure(error!)
        }
        
        return SessionInteractor.jobs(fromJSON: data, into: persistentContainer.viewContext)
    }
    
    func fetchJobs(completion: @escaping (JobsResult) -> Void) {
        
        guard let url = SessionInteractor.getJobsURL() else {
            return
        }//guard let
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            var result = self.processJobsRequest(data: data, error: error)
            
            if case .success = result {
                do {
                    try self.persistentContainer.viewContext.save()
                } catch let error {
                    result = .failure(error)
                }
            }
            
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
        
    }//fetchJobs
    
    func fetchAllJobs(completion: @escaping (JobsResult) -> Void) {
        let fetchRequest: NSFetchRequest<Job> = Job.fetchRequest()
        let sortByPeriod = NSSortDescriptor(key: #keyPath(Job.period), ascending: false)
        fetchRequest.sortDescriptors = [sortByPeriod]
        
        let viewContext = persistentContainer.viewContext
        
        viewContext.perform {
            do {
                let allJobs = try viewContext.fetch(fetchRequest)
                completion(.success(allJobs))
            } catch {
                completion(.failure(error))
            }
        }//viewContext perform
        
    }//fetchAllJobs
    
    
}//JobStore
