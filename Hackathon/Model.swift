//
//  Model.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/3/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import UIKit

enum Currency {
    case USD
    case MXN
}

struct Money {
    var amount : Float
    var currency : Currency
}

struct Coordinate {
    var latitude : Float
    var longitude : Float
}

struct Location {
    var coordinate : Coordinate
}

struct Trip {
    var vehicle : Vehicle
    var accountThatDrives : Account
    var rides : [Ride]
    var startingPoint : Location
    var endingPoint : Location
}

struct Event {
    var point : Location
    var radius : Float
    var time : Float
    var timeRadius : Float
    var route : [Coordinate]
}

struct Ride {
    var price : Money
    var pickUp : Event
    var drop : Event
    var rider : Account
    var trip : Trip
}

enum KindOfVehicle {
    case Car, SUV, Bus, Taxi, Limousine
}

struct Vehicle {
    var kind : KindOfVehicle
    var licensePlate : String
    var capacity : Int
    var brand : String
    var model : String
}

struct Account {
    var name : String
    var photo : UIImage
    var description : String
    var givenRides : Int
    var recievedRides : Int
    var likes : Int
    var dislikes : Int
    var cars : [Vehicle]
    var following : [Account]
    var followers : [Account]
}
