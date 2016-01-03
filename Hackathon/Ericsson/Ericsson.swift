//
//  Ericsson.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/2/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import Alamofire

//    - (void) login:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;

//     KNOW THE VEHICLE

//    - (void) checkRequestStatus:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) viewDiagnosticData:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) getVehicleStatus:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) getBusInfo:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;

//     CONTROL THE VEHICLE

//    - (void) doorUnlock:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) doorLock:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) engineOn:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) engineOff:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) honkAndBlink:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) getVehicleStatus:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;

//     KNOW THE PASSENGER

//    - (void) addAPassenger:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) updateAPassenger:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) deleteAPassenger:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) viewAPassenger:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) searchPassengers:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;

//     KNOW THE PASSENGER

//    - (void) consume:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) getProducts:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) getUserPurchases:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) purchase:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;
//    - (void) refund:(NSDictionary *)params completion:(ASDPRequestCompletionBlock)completion;

// Old params
//    var params : [String: AnyObject] = ["longitude": 55.578545, "latitude": 14.254875, "accuracy": 6, "route" : ["vin" : "3115361391" ]]

typealias BooleanClosure = (Bool) -> ()
typealias SuccessClosure = BooleanClosure

typealias AnyObjectByStringDicstionary = [String: AnyObject]

typealias HandleRequestID = (Int) -> ()


class EricssonManager {

    let logInParameters = ["username" : "provider", "pin": "1234", "vin" : "3115361391"]
    var params = ["route" : ["vin" : "3115361391"]]
    
    private var sharedASDPManager : ASDPRequestManager {
        return ASDPRequestManager.sharedManager()
    }

    private func dictionaryWithData(data : NSData) -> AnyObjectByStringDicstionary {
        return try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! AnyObjectByStringDicstionary
    }
    
    func logIn(success: SuccessClosure) {
        sharedASDPManager.login(logInParameters) { (asdpResult) -> Void in
            success(asdpResult.isSuccess)
        }
    }
    
    private func getRequestID(handler: HandleRequestID, asdpMethod : ([NSObject:AnyObject]!, ASDPRequestCompletionBlock!)->() ){
        asdpMethod(params) { (result) -> Void in
            let data = result.bodyData
            let infoDictionary = self.dictionaryWithData(data)
            let requestID = infoDictionary["requestId"] as! Int
            handler(requestID)
        }
    }
    
    func getVehicleRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.getVehicleStatus)
    }
    
    func getBusRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.getBusInfo)
    }
    
    func getDiagnosticDataRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.viewDiagnosticData)
    }
    
    func checkRequestStatus() {
        sharedASDPManager.checkRequestStatus(params) { (result) -> Void in
            print(result.data)
        }
    }
    
    func stuff(){
        logIn { (_) -> () in
            self.getVehicleRequestID({ (requestID) -> () in
                self.params["route"]!["requestId"] = String(requestID)
                self.checkRequestStatus()
            })
        }
    }
}