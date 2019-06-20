//
//  SessionInteractor.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/19/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit
import CoreData

struct SessionInteractor {
    
    private static let jobsUrl = "http://private-9d004-myresumeapp.apiary-mock.com/jobs"
    
    private static func jobs(fromJSON json: [String:Any], into context: NSManagedObjectContext) -> Job? {
        guard let jobid = json["jobid"] as? String, let job_title = json["job_title"] as? String, let company = json["company"] as? String, let location = json["location"] as? String, let period = json["period"] as? String, let activities = json["activities"] as? String else {
            return nil
        }
        
        let fetchRequest: NSFetchRequest<Job> = Job.fetchRequest()
        let predicate = NSPredicate(format: "\(#keyPath(Job.jobid)) == \(jobid)")
        fetchRequest.predicate = predicate
        
        var fetchedJobs: [Job]?
        context.performAndWait {
            fetchedJobs = try? fetchRequest.execute()
        }
        if let existingJob = fetchedJobs?.first {
            return existingJob
        }
        
        var job: Job!
        context.performAndWait {
            job = Job(context: context)
            job.jobid = jobid
            job.job_title = job_title
            job.company = company
            job.location = location
            job.period = period
            job.activities = activities
        }
        return job
    }//jobs private
    
    static func jobs(fromJSON data: Data, into context: NSManagedObjectContext) -> JobsResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonDictionary = jsonObject as? [AnyHashable:Any], let jobsArray = jsonDictionary["jobs"] as? [[String:Any]] else {
                return .failure(JobsError.invalidJSONData)
            }
            
            var finalJobs = [Job]()
            for jobJSON in jobsArray {
                if let job = jobs(fromJSON: jobJSON, into: context) {
                        finalJobs.append(job)
                    }
            }//for jobJSON
            
            if finalJobs.isEmpty && !jobsArray.isEmpty {
                return .failure(JobsError.invalidJSONData)
            }//if finalJobs Empty
            
            return .success(finalJobs)
        } catch let error {
            return .failure(error)
        }
    }
    
    
    static func getJobsURL() -> URL? {
    
        guard let components = URLComponents(string: jobsUrl), let url = components.url  else {
            return nil
        }//guard components
        
        return url
        
    }//getJobs
    
    
}//SessionInteractor
