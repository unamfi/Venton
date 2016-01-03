//
//  Ericsson.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/2/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import Alamofire

typealias BooleanClosure = (Bool) -> ()
typealias SuccessClosure = BooleanClosure
private typealias HandleRequestID = (Int) -> ()
typealias InfoClosure = ([String: AnyObject]) -> ()
private typealias GetRequestIDClosure = (HandleRequestID) -> ()


private let UsernameKey = "username"
private let PinKey = "pin"
private let VinKey = "vin"
private let RequestIdKey = "requestId"
private let RouteKey = "route"

class EricssonManager {

    private let logInParameters = [UsernameKey : "provider", PinKey: "1234", VinKey : "3115361391"]
    
    func logIn(success: SuccessClosure) {
        sharedASDPManager.login(logInParameters) { (asdpResult) -> Void in
            success(asdpResult.isSuccess)
        }
    }

    private var parameters = [RouteKey : [VinKey : "3115361391"]]
    
    private var sharedASDPManager : ASDPRequestManager {
        return ASDPRequestManager.sharedManager()
    }

    private func dictionaryWithData(data : NSData) -> [String: AnyObject] {
        return try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [String: AnyObject]
    }
    
    private func getRequestID(handler: HandleRequestID, asdpMethod : ([NSObject:AnyObject]!, ASDPRequestCompletionBlock!)->() ){
        asdpMethod(parameters) { (result) -> Void in
            let data = result.bodyData
            let infoDictionary = self.dictionaryWithData(data)
            let requestID = infoDictionary[RequestIdKey] as! Int
            handler(requestID)
        }
    }
        
    private func checkRequestStatus(info : InfoClosure) {
        sharedASDPManager.checkRequestStatus(parameters) { (result) -> Void in
            let dataDictionary = self.dictionaryWithData(result.bodyData)
            info(dataDictionary)
        }
    }
    
    private func addRequestIDToParameters(requestID : Int) {
        self.parameters[RouteKey]![RequestIdKey] = String(requestID)
    }
    
    private func getStatus(info: InfoClosure, getRequestIDClosure : GetRequestIDClosure) {
        getRequestIDClosure({ (requestID) -> () in
            self.addRequestIDToParameters(requestID)
            self.checkRequestStatus(info)
        })
    }
}

extension EricssonManager {
    private func getVehicleRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.getVehicleStatus)
    }
    
    func getVehicleStatus(info : InfoClosure) {
        getStatus(info, getRequestIDClosure: self.getVehicleRequestID)
    }
}

extension EricssonManager {
    private func getBusRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.getBusInfo)
    }
    
    func getBusStatus(info : InfoClosure) {
        getStatus(info, getRequestIDClosure: self.getBusRequestID)
    }
}

extension EricssonManager {
    private func getDiagnosticDataRequestID(handler : HandleRequestID) {
        getRequestID(handler, asdpMethod: sharedASDPManager.viewDiagnosticData)
    }
    
    func getDiagnosticDataStatus(info : InfoClosure) {
        getStatus(info, getRequestIDClosure: self.getDiagnosticDataRequestID)
    }
}
