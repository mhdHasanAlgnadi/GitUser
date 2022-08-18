//
//  GitUserTests.swift
//  GitUserTests
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import XCTest
import RxTest
import RxSwift
@testable import GitUser

class GitUserTests: XCTestCase {
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        disposeBag = DisposeBag()
    }
    
    func testGetUser() throws {
        let expectation = expectation(description: "Get User")
        expectation.assertForOverFulfill = false
        let searchForUserVM = SearchForUserVM()
        let username = "octocat"
        let rx = searchForUserVM.getUser(username: username)
        rx.subscribe(onNext: { response in
            XCTAssertTrue(response.login == username)
            XCTAssertTrue(response.login != nil)
            XCTAssertTrue(response.id != nil)
            expectation.fulfill()
        }, onError: { error in
            
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: 10)
    }
    
    func testCreateUser() throws {
        let userToBeSaved = User(login: "octocat", id: 1, name: "monalisa octocat", avatarURL: "https://github.com/images/error/octocat_happy.gif", followers: 20, following: 0, location: "San Francisco", bio: "There once was...", created_at: "2008-01-14T04:33:35Z")
        CoreDataManager.shared.create(userToBeSaved)
        let fetchedUsers = CoreDataManager.shared.fetchUser()
        XCTAssertTrue(fetchedUsers.contains(where: {$0.login == "octocat"}))
        
    }
    

}
