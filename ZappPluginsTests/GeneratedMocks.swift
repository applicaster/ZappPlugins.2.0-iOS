// MARK: - Mocks generated from file: ZappPlugins/General/Universal/ZPIdentityClientBase.swift at 2020-02-18 17:29:52 +0000

//
//  ZPIdentityClientBase.swift
//  ZappPlugins
//
//  Created by Anton Kononenko on 1/28/19.
//  Copyright © 2019 Applicaster LTD. All rights reserved.
//

import Cuckoo
@testable import ZappPlugins

import Foundation


public class MockZPIdentityClientBase: ZPIdentityClientBase, Cuckoo.ClassMock {
    
    public typealias MocksType = ZPIdentityClientBase
    
    public typealias Stubbing = __StubbingProxy_ZPIdentityClientBase
    public typealias Verification = __VerificationProxy_ZPIdentityClientBase

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ZPIdentityClientBase?

    public func enableDefaultImplementation(_ stub: ZPIdentityClientBase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    public override var bucketID: String {
        get {
            return cuckoo_manager.getter("bucketID",
                superclassCall:
                    
                    super.bucketID
                    ,
                defaultCall: __defaultImplStub!.bucketID)
        }
        
        set {
            cuckoo_manager.setter("bucketID",
                value: newValue,
                superclassCall:
                    
                    super.bucketID = newValue
                    ,
                defaultCall: __defaultImplStub!.bucketID = newValue)
        }
        
    }
    
    
    
    public override var sessionURL: URL? {
        get {
            return cuckoo_manager.getter("sessionURL",
                superclassCall:
                    
                    super.sessionURL
                    ,
                defaultCall: __defaultImplStub!.sessionURL)
        }
        
    }
    
    
    
    public override var createDeviceURL: URL? {
        get {
            return cuckoo_manager.getter("createDeviceURL",
                superclassCall:
                    
                    super.createDeviceURL
                    ,
                defaultCall: __defaultImplStub!.createDeviceURL)
        }
        
    }
    
    
    
    public override var defaultURLQueryItems: [URLQueryItem] {
        get {
            return cuckoo_manager.getter("defaultURLQueryItems",
                superclassCall:
                    
                    super.defaultURLQueryItems
                    ,
                defaultCall: __defaultImplStub!.defaultURLQueryItems)
        }
        
    }
    
    
    
    public override var sessionURLQueryItems: [URLQueryItem] {
        get {
            return cuckoo_manager.getter("sessionURLQueryItems",
                superclassCall:
                    
                    super.sessionURLQueryItems
                    ,
                defaultCall: __defaultImplStub!.sessionURLQueryItems)
        }
        
    }
    
    
    
    public override var deviceType: String {
        get {
            return cuckoo_manager.getter("deviceType",
                superclassCall:
                    
                    super.deviceType
                    ,
                defaultCall: __defaultImplStub!.deviceType)
        }
        
    }
    
    
    
    public override var deviceURLQueryItems: [URLQueryItem] {
        get {
            return cuckoo_manager.getter("deviceURLQueryItems",
                superclassCall:
                    
                    super.deviceURLQueryItems
                    ,
                defaultCall: __defaultImplStub!.deviceURLQueryItems)
        }
        
    }
    

    

    
    
    
    public override func createSession(completion: ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)  {
        
    return cuckoo_manager.call("createSession(completion: ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.createSession(completion: completion)
                ,
            defaultCall: __defaultImplStub!.createSession(completion: completion))
        
    }
    
    
    
    public override func createURLRequest(from url: URL?, method: String) -> URLRequest? {
        
    return cuckoo_manager.call("createURLRequest(from: URL?, method: String) -> URLRequest?",
            parameters: (url, method),
            escapingParameters: (url, method),
            superclassCall:
                
                super.createURLRequest(from: url, method: method)
                ,
            defaultCall: __defaultImplStub!.createURLRequest(from: url, method: method))
        
    }
    
    
    
    public override func isRestMethodAvailible(method: String) -> Bool {
        
    return cuckoo_manager.call("isRestMethodAvailible(method: String) -> Bool",
            parameters: (method),
            escapingParameters: (method),
            superclassCall:
                
                super.isRestMethodAvailible(method: method)
                ,
            defaultCall: __defaultImplStub!.isRestMethodAvailible(method: method))
        
    }
    
    
    
    public override func createDevice(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void))  {
        
    return cuckoo_manager.call("createDevice(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void))",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.createDevice(completion: completion)
                ,
            defaultCall: __defaultImplStub!.createDevice(completion: completion))
        
    }
    
    
    
    public override func dictFromData(data: Data?) -> [String: Any]? {
        
    return cuckoo_manager.call("dictFromData(data: Data?) -> [String: Any]?",
            parameters: (data),
            escapingParameters: (data),
            superclassCall:
                
                super.dictFromData(data: data)
                ,
            defaultCall: __defaultImplStub!.dictFromData(data: data))
        
    }
    

	public struct __StubbingProxy_ZPIdentityClientBase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var bucketID: Cuckoo.ClassToBeStubbedProperty<MockZPIdentityClientBase, String> {
	        return .init(manager: cuckoo_manager, name: "bucketID")
	    }
	    
	    
	    var sessionURL: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, URL?> {
	        return .init(manager: cuckoo_manager, name: "sessionURL")
	    }
	    
	    
	    var createDeviceURL: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, URL?> {
	        return .init(manager: cuckoo_manager, name: "createDeviceURL")
	    }
	    
	    
	    var defaultURLQueryItems: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, [URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "defaultURLQueryItems")
	    }
	    
	    
	    var sessionURLQueryItems: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, [URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "sessionURLQueryItems")
	    }
	    
	    
	    var deviceType: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, String> {
	        return .init(manager: cuckoo_manager, name: "deviceType")
	    }
	    
	    
	    var deviceURLQueryItems: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockZPIdentityClientBase, [URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "deviceURLQueryItems")
	    }
	    
	    
	    func createSession<M1: Cuckoo.OptionalMatchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<(((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)> where M1.OptionalMatchedType == ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockZPIdentityClientBase.self, method: "createSession(completion: ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)", parameterMatchers: matchers))
	    }
	    
	    func createURLRequest<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(from url: M1, method: M2) -> Cuckoo.ClassStubFunction<(URL?, String), URLRequest?> where M1.OptionalMatchedType == URL, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(URL?, String)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockZPIdentityClientBase.self, method: "createURLRequest(from: URL?, method: String) -> URLRequest?", parameterMatchers: matchers))
	    }
	    
	    func isRestMethodAvailible<M1: Cuckoo.Matchable>(method: M1) -> Cuckoo.ClassStubFunction<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: method) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockZPIdentityClientBase.self, method: "isRestMethodAvailible(method: String) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func createDevice<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<(((_ success: Bool, _ error: Error?) -> Void))> where M1.MatchedType == ((_ success: Bool, _ error: Error?) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((_ success: Bool, _ error: Error?) -> Void))>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockZPIdentityClientBase.self, method: "createDevice(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void))", parameterMatchers: matchers))
	    }
	    
	    func dictFromData<M1: Cuckoo.OptionalMatchable>(data: M1) -> Cuckoo.ClassStubFunction<(Data?), [String: Any]?> where M1.OptionalMatchedType == Data {
	        let matchers: [Cuckoo.ParameterMatcher<(Data?)>] = [wrap(matchable: data) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockZPIdentityClientBase.self, method: "dictFromData(data: Data?) -> [String: Any]?", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_ZPIdentityClientBase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var bucketID: Cuckoo.VerifyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "bucketID", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var sessionURL: Cuckoo.VerifyReadOnlyProperty<URL?> {
	        return .init(manager: cuckoo_manager, name: "sessionURL", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var createDeviceURL: Cuckoo.VerifyReadOnlyProperty<URL?> {
	        return .init(manager: cuckoo_manager, name: "createDeviceURL", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var defaultURLQueryItems: Cuckoo.VerifyReadOnlyProperty<[URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "defaultURLQueryItems", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var sessionURLQueryItems: Cuckoo.VerifyReadOnlyProperty<[URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "sessionURLQueryItems", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var deviceType: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "deviceType", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var deviceURLQueryItems: Cuckoo.VerifyReadOnlyProperty<[URLQueryItem]> {
	        return .init(manager: cuckoo_manager, name: "deviceURLQueryItems", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func createSession<M1: Cuckoo.OptionalMatchable>(completion: M1) -> Cuckoo.__DoNotUse<(((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?), Void> where M1.OptionalMatchedType == ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("createSession(completion: ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func createURLRequest<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(from url: M1, method: M2) -> Cuckoo.__DoNotUse<(URL?, String), URLRequest?> where M1.OptionalMatchedType == URL, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(URL?, String)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }]
	        return cuckoo_manager.verify("createURLRequest(from: URL?, method: String) -> URLRequest?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func isRestMethodAvailible<M1: Cuckoo.Matchable>(method: M1) -> Cuckoo.__DoNotUse<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: method) { $0 }]
	        return cuckoo_manager.verify("isRestMethodAvailible(method: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func createDevice<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<(((_ success: Bool, _ error: Error?) -> Void)), Void> where M1.MatchedType == ((_ success: Bool, _ error: Error?) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((_ success: Bool, _ error: Error?) -> Void))>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("createDevice(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void))", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func dictFromData<M1: Cuckoo.OptionalMatchable>(data: M1) -> Cuckoo.__DoNotUse<(Data?), [String: Any]?> where M1.OptionalMatchedType == Data {
	        let matchers: [Cuckoo.ParameterMatcher<(Data?)>] = [wrap(matchable: data) { $0 }]
	        return cuckoo_manager.verify("dictFromData(data: Data?) -> [String: Any]?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class ZPIdentityClientBaseStub: ZPIdentityClientBase {
    
    
    public override var bucketID: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    public override var sessionURL: URL? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL?).self)
        }
        
    }
    
    
    public override var createDeviceURL: URL? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL?).self)
        }
        
    }
    
    
    public override var defaultURLQueryItems: [URLQueryItem] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([URLQueryItem]).self)
        }
        
    }
    
    
    public override var sessionURLQueryItems: [URLQueryItem] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([URLQueryItem]).self)
        }
        
    }
    
    
    public override var deviceType: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    
    
    public override var deviceURLQueryItems: [URLQueryItem] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([URLQueryItem]).self)
        }
        
    }
    

    

    
    public override func createSession(completion: ((_ success: Bool, _ responseObject: [String: Any]?, _ responseCode: ZPHTTPStatusCode?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public override func createURLRequest(from url: URL?, method: String) -> URLRequest?  {
        return DefaultValueRegistry.defaultValue(for: (URLRequest?).self)
    }
    
    public override func isRestMethodAvailible(method: String) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
    public override func createDevice(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public override func dictFromData(data: Data?) -> [String: Any]?  {
        return DefaultValueRegistry.defaultValue(for: ([String: Any]?).self)
    }
    
}

