//
//  Constants.swift
//  api-client
//
//  Created by Steven Sherry on 4/9/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import Foundation

// Callbacks
// Typealias for callbacks used in DataService
typealias callback = (_ success: Bool) -> ()

// Base URL
let BASE_API_URL = "https://collectormage.com/api/v1"

// GET all food trucks
let GET_ALL_FT_URL = "\(BASE_API_URL)/foodtruck"

// GET all reviews for a specific good truck
let GET_ALL_FT_REVIEWS_URL = "\(BASE_API_URL)/foodtruck/reviews"

// POST add new Food Truck
let POST_ADD_NEW_TRUCK = "\(BASE_API_URL)/foodtruck/add"

// POST add review for a specific food truck
let POST_ADD_NEW_REVIEW = "\(BASE_API_URL)/foodtruck/reviews/add"

// Boolean auth UserDefaults keys
let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"

//Auth Email
let DEFAULTS_EMAIL = "email"

//Auth Token
let DEFAULTS_TOKEN = "token"

// REGISTER url

let POST_REGISTER_ACCT = "\(BASE_API_URL)/account/register"

let POST_LOGIN_ACCT = "\(BASE_API_URL)/account/login"
