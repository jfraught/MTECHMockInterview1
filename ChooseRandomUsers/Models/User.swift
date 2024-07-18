//
//  User.swift
//  ChooseRandomUsers
//
//  Created by Jordan Fraughton on 7/18/24.
//

import Foundation

struct User {
    var id = UUID()
    var name: String
}

extension User: Codable {
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("users").appendingPathExtension("plist")
    
    static func loadUsers() -> [User]? {
        guard let codedUsers = try? Data(contentsOf: archiveURL) else { return nil }
        
        return try? PropertyListDecoder().decode(Array<User>.self, from: codedUsers)
    }
    
    static func saveUsers(_ users: [User]) {
        let codedUsers = try? PropertyListEncoder().encode(users)
        try? codedUsers?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleUsers() -> [User] {
        let userOne = User(name: "Jordan")
        let userTwo = User(name: "Juli")
        let userThree = User(name: "Allie")
        let userFour = User(name: "William")
        
        return [userOne, userTwo, userThree, userFour]
    }
}
