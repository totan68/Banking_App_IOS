//
//  Users.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 12/08/24.
//

import Foundation

struct Users: Identifiable, Codable {
    let id: String
    var fullname: String
    var email: String
    
    var firstName: String {
        return nameComponents?.givenName ?? ""
    }
    
    var lastName: String {
        return nameComponents?.familyName ?? ""
    }
    
    private var nameComponents: PersonNameComponents? {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension Users {
    static var Mock_User = Users(id: NSUUID().uuidString, fullname: "Udita Chakraborty", email: "udita.chakraborty@gds.ey.com")
}
