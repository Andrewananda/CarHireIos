//
//  ApiResponse.swift
//  CarHire
//
//  Created by Andrew Ananda on 19/05/2021.
//

import Foundation

public enum Errors : Error {
    case emptyResponse
    case custom(Int, String)
    case apiError(String)
}
