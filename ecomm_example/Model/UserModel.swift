import Foundation
struct UserModel : Codable {
	let products : [Products]?
	let total : Int?
	let skip : Int?
	let limit : Int?

	enum CodingKeys: String, CodingKey {

		case products = "products"
		case total = "total"
		case skip = "skip"
		case limit = "limit"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		products = try values.decodeIfPresent([Products].self, forKey: .products)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		skip = try values.decodeIfPresent(Int.self, forKey: .skip)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
	}

}
