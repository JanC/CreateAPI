// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var pet: Pet {
        Pet(path: "/pet")
    }

    public struct Pet {
        /// Path: `/pet`
        public let path: String

        /// Add a new pet to the store
        public func post(_ body: edgecases_rename_properties.Pet) -> Request<Void> {
            .post(path, body: body)
        }

        /// Update an existing pet
        public func put(_ body: edgecases_rename_properties.Pet) -> Request<Void> {
            .put(path, body: body)
        }
    }
}

extension Paths.Pet {
    public var findByStatus: FindByStatus {
        FindByStatus(path: path + "/findByStatus")
    }

    public struct FindByStatus {
        /// Path: `/pet/findByStatus`
        public let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        public func get(status: [Status]) -> Request<[edgecases_rename_properties.Pet]> {
            .get(path, query: makeGetQuery(status))
        }

        private func makeGetQuery(_ status: [Status]) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status", explode: false)
            return encoder.items
        }

        public enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}

extension Paths.Pet {
    public var findByStatus2: FindByStatus2 {
        FindByStatus2(path: path + "/findByStatus2")
    }

    public struct FindByStatus2 {
        /// Path: `/pet/findByStatus2`
        public let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        public func get(status: [Status]? = nil) -> Request<[edgecases_rename_properties.Pet]> {
            .get(path, query: makeGetQuery(status))
        }

        private func makeGetQuery(_ status: [Status]?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status")
            return encoder.items
        }

        public enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}

extension Paths.Pet {
    public var findByTags: FindByTags {
        FindByTags(path: path + "/findByTags")
    }

    public struct FindByTags {
        /// Path: `/pet/findByTags`
        public let path: String

        /// Finds Pets by tags
        ///
        /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
        public func get(tags: [String]) -> Request<[edgecases_rename_properties.Pet]> {
            .get(path, query: makeGetQuery(tags))
        }

        private func makeGetQuery(_ tags: [String]) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(tags, forKey: "tags", explode: false)
            return encoder.items
        }
    }
}

extension Paths.Pet {
    public func petID(_ petID: Int) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    public struct WithPetID {
        /// Path: `/pet/{petId}`
        public let path: String

        /// Find pet by ID
        ///
        /// Returns a single pet
        public var get: Request<edgecases_rename_properties.Pet> {
            .get(path)
        }

        /// Updates a pet in the store with form data
        public func post(_ body: PostRequest? = nil) -> Request<Void> {
            .post(path, body: body.map(URLQueryEncoder.encode)?.percentEncodedQuery)
        }

        public struct PostRequest: Encodable {
            /// Updated name of the pet
            public var name: String?
            /// Updated status of the pet
            public var status: String?

            public init(name: String? = nil, status: String? = nil) {
                self.name = name
                self.status = status
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(name, forKey: "name")
                encoder.encode(status, forKey: "status")
                return encoder.items
            }
        }

        /// Deletes a pet
        public var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths.Pet.WithPetID {
    public var uploadImage: UploadImage {
        UploadImage(path: path + "/uploadImage")
    }

    public struct UploadImage {
        /// Path: `/pet/{petId}/uploadImage`
        public let path: String

        /// Uploads an image
        public func post(_ body: Data? = nil) -> Request<edgecases_rename_properties.APIResponse> {
            .post(path, body: body)
        }
    }
}

extension Paths {
    public static var store: Store {
        Store(path: "/store")
    }

    public struct Store {
        /// Path: `/store`
        public let path: String
    }
}

extension Paths.Store {
    public var inventory: Inventory {
        Inventory(path: path + "/inventory")
    }

    public struct Inventory {
        /// Path: `/store/inventory`
        public let path: String

        /// Returns pet inventories by status
        ///
        /// Returns a map of status codes to quantities
        public var get: Request<[String: Int]> {
            .get(path)
        }
    }
}

extension Paths.Store {
    public var order: Order {
        Order(path: path + "/order")
    }

    public struct Order {
        /// Path: `/store/order`
        public let path: String

        /// Place an order for a pet
        public func post(_ body: edgecases_rename_properties.Order) -> Request<edgecases_rename_properties.Order> {
            .post(path, body: body)
        }
    }
}

extension Paths.Store.Order {
    public func orderID(_ orderID: Int) -> WithOrder {
        WithOrder(path: "\(path)/order-\(orderID)")
    }

    public struct WithOrder {
        /// Path: `/store/order/order-{order_id}`
        public let path: String

        /// Find purchase order by ID
        ///
        /// For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
        public var get: Request<edgecases_rename_properties.Order> {
            .get(path)
        }

        /// Delete purchase order by ID
        ///
        /// For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
        public var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths {
    public static var user: User {
        User(path: "/user")
    }

    public struct User {
        /// Path: `/user`
        public let path: String

        /// Create user
        ///
        /// This can only be done by the logged in user.
        public func post(_ body: edgecases_rename_properties.User) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    public var createWithArray: CreateWithArray {
        CreateWithArray(path: path + "/createWithArray")
    }

    public struct CreateWithArray {
        /// Path: `/user/createWithArray`
        public let path: String

        /// Creates list of users with given input array
        public func post(_ body: [edgecases_rename_properties.User]) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    public var createWithList: CreateWithList {
        CreateWithList(path: path + "/createWithList")
    }

    public struct CreateWithList {
        /// Path: `/user/createWithList`
        public let path: String

        /// Creates list of users with given input array
        public func post(_ body: [edgecases_rename_properties.User]) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    public var login: Login {
        Login(path: path + "/login")
    }

    public struct Login {
        /// Path: `/user/login`
        public let path: String

        /// Logs user into the system
        public func get(username: String, password: String) -> Request<String> {
            .get(path, query: [("username", username), ("password", password)])
        }

        public enum GetResponseHeaders {
            /// Calls per hour allowed by the user
            @available(*, deprecated, message: "Deprecated")
            public static let rateLimit = HTTPHeader<Int>(field: "X-Rate-Limit")
            /// Date in UTC when toekn expires
            public static let expiresAfter = HTTPHeader<Date>(field: "X-Expires-After")
        }
    }
}

extension Paths.User {
    public var logout: Logout {
        Logout(path: path + "/logout")
    }

    public struct Logout {
        /// Path: `/user/logout`
        public let path: String

        /// Logs out current logged in user session
        public var get: Request<Void> {
            .get(path)
        }
    }
}

extension Paths.User {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/user/{username}`
        public let path: String

        /// Get user by user name
        public var get: Request<edgecases_rename_properties.User> {
            .get(path)
        }

        /// Updated user
        ///
        /// This can only be done by the logged in user.
        public func put(_ body: edgecases_rename_properties.User) -> Request<Void> {
            .put(path, body: body)
        }

        /// Delete user
        ///
        /// This can only be done by the logged in user.
        public var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths {
    public static var fake: Fake {
        Fake(path: "/fake")
    }

    public struct Fake {
        /// Path: `/fake`
        public let path: String

        /// To test enum parameters
        public func get(parameters: GetParameters? = nil) -> Request<Void> {
            .get(path, query: parameters?.asQuery)
        }

        public struct GetParameters {
            public var enumQueryStringArray: [EnumQueryStringArray]?
            public var enumQueryString: EnumQueryString?
            public var enumQueryInteger: Int?

            public enum EnumQueryStringArray: String, Codable, CaseIterable {
                case greaterThan = ">"
                case dollar = "$"
            }

            public enum EnumQueryString: String, Codable, CaseIterable {
                case abc = "_abc"
                case minusefg = "-efg"
                case xyz = "(xyz)"
            }

            public init(enumQueryStringArray: [EnumQueryStringArray]? = nil, enumQueryString: EnumQueryString? = nil, enumQueryInteger: Int? = nil) {
                self.enumQueryStringArray = enumQueryStringArray
                self.enumQueryString = enumQueryString
                self.enumQueryInteger = enumQueryInteger
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(enumQueryStringArray, forKey: "enum_query_string_array")
                encoder.encode(enumQueryString, forKey: "enum_query_string")
                encoder.encode(enumQueryInteger, forKey: "enum_query_integer")
                return encoder.items
            }
        }

        /// Fake endpoint for testing various parameters
        public func post(_ body: PostRequest? = nil) -> Request<Void> {
            .post(path, body: body.map(URLQueryEncoder.encode)?.percentEncodedQuery)
        }

        public struct PostRequest: Encodable {
            /// None
            public var integer: Int?
            /// None
            public var int32: Int?
            /// None
            public var int64: Int?
            /// None
            public var number: Double
            /// None
            public var float: Double?
            /// None
            public var double: Double
            /// None
            public var string: String?
            /// None
            public var patternWithoutDelimiter: String
            /// None
            public var byte: String
            /// None
            public var binary: String?
            /// None
            public var date: NaiveDate?
            /// None
            public var dateTime: Date?
            /// None
            public var password: String?
            /// None
            public var callback: String?

            public init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Double? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: String, binary: String? = nil, date: NaiveDate? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
                self.integer = integer
                self.int32 = int32
                self.int64 = int64
                self.number = number
                self.float = float
                self.double = double
                self.string = string
                self.patternWithoutDelimiter = patternWithoutDelimiter
                self.byte = byte
                self.binary = binary
                self.date = date
                self.dateTime = dateTime
                self.password = password
                self.callback = callback
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(integer, forKey: "integer")
                encoder.encode(int32, forKey: "int32")
                encoder.encode(int64, forKey: "int64")
                encoder.encode(number, forKey: "number")
                encoder.encode(float, forKey: "float")
                encoder.encode(double, forKey: "double")
                encoder.encode(string, forKey: "string")
                encoder.encode(patternWithoutDelimiter, forKey: "pattern_without_delimiter")
                encoder.encode(byte, forKey: "byte")
                encoder.encode(binary, forKey: "binary")
                encoder.encode(date, forKey: "date")
                encoder.encode(dateTime, forKey: "dateTime")
                encoder.encode(password, forKey: "password")
                encoder.encode(callback, forKey: "callback")
                return encoder.items
            }
        }

        /// To test "client" model
        public func patch(_ body: edgecases_rename_properties.Client) -> Request<edgecases_rename_properties.Client> {
            .patch(path, body: body)
        }
    }
}

public enum Paths {}
