// Copyright 2016-2017 Cisco Systems Inc
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation


/// An email address data type with email validation and equatable implementation.
///
/// - since: 1.2.0
open class EmailAddress: Equatable {
    fileprivate var address: String
    
    private init(_ address: String) {
        self.address = address
    }
    
    /// Create an *EmailAddress* object from a string
    ///
    /// - parameter address: The email address string.
    /// - returns: EmailAddress
    /// - since: 1.2.0
    open static func fromString(_ address: String) -> EmailAddress? {
        guard isValid(address) else {
            return nil
        }
        
        return EmailAddress(address)
    }
    
    /// Get the email address string from this *EmailAddress* object.
    ///
    /// - returns: String
    /// - since: 1.2.0
    open func toString() -> String {
        return address
    }
    
    private static func isValid(_ address: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: address)
    }
}

/// This function checks if two email addresses are equal
/// This is the Equatable implementation for *EmailAddress*. .
///
/// - returns: Bool if the two email addresses are the equal. (? true?)
/// - since: 1.2.0
public func ==(lhs: EmailAddress, rhs: EmailAddress) -> Bool {
    return lhs.address == rhs.address
}
