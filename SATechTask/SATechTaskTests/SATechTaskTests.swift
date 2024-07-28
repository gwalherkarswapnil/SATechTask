//
//  SATechTaskTests.swift
//  SATechTaskTests
//
//  Created by Swapnil on 29/07/24.
//

import XCTest
@testable import SATechTask
final class SATechTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var viewModel: LoginViewModel!

       override func setUp() {
           super.setUp()
           viewModel = LoginViewModel(authService: AuthNetworkService())
       }

       override func tearDown() {
           viewModel = nil
           super.tearDown()
       }

       func testLoginSuccess() {
           // Given
           let email = "test@example.com"
           let password = "password"
           viewModel.email = email
           viewModel.password = password
           
           let expectation = self.expectation(description: "Login success")

           // When
           viewModel.loginUser { success in
               // Then
               XCTAssertTrue(success, "Login should succeed")
               expectation.fulfill()
           }

           waitForExpectations(timeout: 5, handler: nil)
       }

       func testLoginFailure() {
           // Given
           let email = "wrong@example.com"
           let password = "wrongpassword"
           viewModel.email = email
           viewModel.password = password
           
           let expectation = self.expectation(description: "Login failure")

           // When
           viewModel.loginUser { success in
               // Then
               XCTAssertFalse(success, "Login should fail")
               expectation.fulfill()
           }

           waitForExpectations(timeout: 5, handler: nil)
       }

       func testNavigationToWelcomeView() {
           // Given
           let loginView = LoginView()
           let email = "test@example.com"
           let password = "password"
           
           viewModel.email = email
           viewModel.password = password
           
           let expectation = self.expectation(description: "Navigation to WelcomeView")

           // When
           viewModel.loginUser { success in
               // Then
               XCTAssertTrue(success, "Login should succeed")
//               loginView.showWelcomeView = true
               expectation.fulfill()
           }

           waitForExpectations(timeout: 5, handler: nil)
//           XCTAssertTrue(loginView.showWelcomeView, "Should navigate to WelcomeView")
       }

       // You can also write similar tests for the Sign-Up functionality
       func testSignUp() {
           // Implement your sign-up tests
       }

}
