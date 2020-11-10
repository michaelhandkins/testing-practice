//
//  ValidationServiceTests.swift
//  Just Start Testing Tests
//
//  Created by Michael Handkins on 11/10/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//
@testable import Just_Start_Testing
import XCTest

class ValidationServiceTests: XCTestCase {

    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
        
        
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUsername("Kilo Loco"))
    }
    
    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername(nil)) {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_username_too_short() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername("MH")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_username_too_long() throws {
        
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername("12345678912345678920")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        
    }
    
    
    

}
