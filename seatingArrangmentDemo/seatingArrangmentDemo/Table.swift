//
//  Table.swift
//  seatingArrangmentDemo
//
//  Created by Square Infosoft on 21/10/22.
//

import Foundation

struct Tables {
    
    let tableId: String?
    let tableNo: String?
    let leftX: Int?
    let topY: Int?
    let size: String?
    let shape: String?
    let capacity: Int?
    let noOfBookingRequest: Int?
    let noOfReservationUpcoming: Int?
    let isBooked: Bool?

    internal init(tableId: String?, tableNo: String?, leftX: Int?, topY: Int?, size: String?, shape: String?, capacity: Int?, noOfBookingRequest: Int?, noOfReservationUpcoming: Int?, isBooked: Bool?) {
        self.tableId = tableId
        self.tableNo = tableNo
        self.leftX = leftX
        self.topY = topY
        self.size = size
        self.shape = shape
        self.capacity = capacity
        self.noOfBookingRequest = noOfBookingRequest
        self.noOfReservationUpcoming = noOfReservationUpcoming
        self.isBooked = isBooked
    }

//    init(_ dict: [String: Any]) {
//        tableId = dict["tableId"] as? String
//        tableNo = dict["tableNo"] as? String
//        leftX = dict["left/x"] as? Int
//        topY = dict["top/y"] as? Int
//        size = dict["size"] as? String
//        shape = dict["shape"] as? String
//        capacity = dict["capacity"] as? Int
//    }

//    func toDictionary() -> [String: Any] {
//        var jsonDict = [String: Any]()
//        jsonDict["tableId"] = tableId
//        jsonDict["tableNo"] = tableNo
//        jsonDict["left/x"] = leftX
//        jsonDict["top/y"] = topY
//        jsonDict["size"] = size
//        jsonDict["shape"] = shape
//        jsonDict["capacity"] = capacity
//        return jsonDict
//    }
}
