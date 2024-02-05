//
//  TestViewModel.swift
//  PlayWorld
//
//  Created by Lenard Pop on 02/02/2024.
//

import Foundation
import Mockable

@Mockable
protocol TestProtocol {
    func testing() -> [String]
    func testingAsync() async -> [String]
}

class TestProtocolModel: TestProtocol {
    func testing() -> [String] {
        return ["SomeCool", "Some", "Cool"]
    }
    
    func testingAsync() async -> [String] {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return ["Cool", "SomeCool", "Some"]
        } catch {
            print(error)
            return []
        }
    }
}

class TestViewModel: ObservableObject {
    private var service: TestProtocol? = nil
    
    public var results: [String] = []
    
    init() {
        service = TestProtocolModel()
    }
    
    convenience init(service: TestProtocol) {
        self.init()
        self.service = service
    }
    
    func fetchResults() {
        self.results = service?.testing() ?? []
    }
    
    func fetchResultsAsync() async {
        self.results = await service?.testingAsync() ?? []
    }
}
