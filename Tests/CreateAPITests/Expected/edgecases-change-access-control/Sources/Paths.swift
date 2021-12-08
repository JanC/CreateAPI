// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient

 enum Paths {}

extension Paths {
    static var pet: Pet {
        Pet(path: "/pet")
    }

    struct Pet {
        // /pet
        let path: String


    }
}

extension Paths.Pet {
    var findByStatus: FindByStatus {
        FindByStatus(path: path + "/findByStatus")
    }

    struct FindByStatus {
        // /pet/findByStatus
        let path: String


    }
}

extension Paths.Pet {
    var findByTags: FindByTags {
        FindByTags(path: path + "/findByTags")
    }

    struct FindByTags {
        // /pet/findByTags
        let path: String


    }
}

extension Paths.Pet {
    func petID(_ petID: String) -> WithPetID {
        WithPetID(path: path + "/" + petID)
    }

    struct WithPetID {
        // /pet/{petId}
        let path: String

        /// Find pet by ID
        func get() -> Request<Pet> {
            .get(path)
        }
    }
}

extension Paths.Pet.WithPetID {
    var uploadImage: UploadImage {
        UploadImage(path: path + "/uploadImage")
    }

    struct UploadImage {
        // /pet/{petId}/uploadImage
        let path: String


    }
}

extension Paths {
    static var store: Store {
        Store(path: "/store")
    }

    struct Store {
        // /store
        let path: String
    }
}

extension Paths.Store {
    var inventory: Inventory {
        Inventory(path: path + "/inventory")
    }

    struct Inventory {
        // /store/inventory
        let path: String


    }
}

extension Paths.Store {
    var order: Order {
        Order(path: path + "/order")
    }

    struct Order {
        // /store/order
        let path: String


    }
}

extension Paths.Store.Order {
    func orderID(_ orderID: String) -> WithOrderID {
        WithOrderID(path: path + "/" + orderID)
    }

    struct WithOrderID {
        // /store/order/{order_id}
        let path: String

        /// Find purchase order by ID
        func get() -> Request<Order> {
            .get(path)
        }
    }
}

extension Paths {
    static var user: User {
        User(path: "/user")
    }

    struct User {
        // /user
        let path: String


    }
}

extension Paths.User {
    var createWithArray: CreateWithArray {
        CreateWithArray(path: path + "/createWithArray")
    }

    struct CreateWithArray {
        // /user/createWithArray
        let path: String


    }
}

extension Paths.User {
    var createWithList: CreateWithList {
        CreateWithList(path: path + "/createWithList")
    }

    struct CreateWithList {
        // /user/createWithList
        let path: String


    }
}

extension Paths.User {
    var login: Login {
        Login(path: path + "/login")
    }

    struct Login {
        // /user/login
        let path: String


    }
}

extension Paths.User {
    var logout: Logout {
        Logout(path: path + "/logout")
    }

    struct Logout {
        // /user/logout
        let path: String

        /// Logs out current logged in user session
        func get() -> Request<Void> {
            .get(path)
        }
    }
}

extension Paths.User {
    func username(_ username: String) -> WithUsername {
        WithUsername(path: path + "/" + username)
    }

    struct WithUsername {
        // /user/{username}
        let path: String

        /// Get user by user name
        func get() -> Request<User> {
            .get(path)
        }
    }
}

extension Paths {
    static var fake: Fake {
        Fake(path: "/fake")
    }

    struct Fake {
        // /fake
        let path: String

        /// To test enum parameters
        func get() -> Request<Void> {
            .get(path)
        }
    }
}

