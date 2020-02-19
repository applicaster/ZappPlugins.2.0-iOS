//
//  ZPIdentityClientBaseTests.swift
//  ZappPlugins
//
//  Created by Anton Kononenko on 1/29/19.
//  Copyright © 2019 Applicaster LTD. All rights reserved.
//

import Cuckoo
import XCTest
@testable import ZappPlugins
@testable import ZappCore

class ZPIdentityClientBaseTests: XCTestCase {
    var mock: MockZPIdentityClientBase!

    class func appVersion() -> String {
        return "1.1"
    }

    class func bundleIdentifier() -> String {
        return "com.test.app"
    }

    var systemVersion: String {
        return "10.2"
    }

    class var deviceID: String {
        return "1111-1111-1111-1111"
    }

    var deviceToken: String {
        return "ABCDEFG"
    }

    class func getStringForKey(key: String) -> String {
        if key == "APUUID" {
            return "1111-1111-1111-1111"
        } else if key == "APToken" {
            return "ABCDEFG"
        } else {
            return ""
        }
    }

    var userInterfaceIdiom: UIUserInterfaceIdiom {
        return .phone
    }

    let correctDefaultURLQueryItemsResult: [URLQueryItem] = [
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientDefaultParams.deviceOSVersion,
                     value: "10.2"),
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientDefaultParams.deviceBundleVersion,
                     value: "1.1"),
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientDefaultParams.deviceBundleID,
                     value: "com.test.app"),
    ]
    let correctSessionItemsResult: [URLQueryItem] = [
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientSessionParams.deviceID,
                     value: "1111-1111-1111-1111"),
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientSessionParams.deviceToken,
                     value: "ABCDEFG"),
    ]

    let correctDeviceItemsResult: [URLQueryItem] = [
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientDeviceParams.deviceModel,
                     value: "iPhone"),
        URLQueryItem(name: ZPIdentityClientBase.ZPIdentityClientDeviceParams.deviceType,
                     value: ZPIdentityClientBase.ZPIdentityClientDeviceParams.deviceTypeValue),
    ]

    func swizzleMethods(revert: Bool = false) {
        // https://medium.com/@abhimuralidharan/method-swizzling-in-ios-swift-1f38edaf984f
        swizzleClassMethod(originalClass: UIApplication.self,
                           swizzledClass: ZPIdentityClientBaseTests.self,
                           originalSelector: #selector(UIApplication.appVersion),
                           swizzledSelector: #selector(ZPIdentityClientBaseTests.appVersion),
                           revert: revert)

        swizzleClassMethod(originalClass: APKeychain.self,
                           swizzledClass: ZPIdentityClientBaseTests.self,
                           originalSelector: #selector(APKeychain.bundleIdentifier),
                           swizzledSelector: #selector(ZPIdentityClientBaseTests.bundleIdentifier),
                           revert: revert)

        swizzleInstanceMethod(originalClass: UIDevice.self,
                              swizzledClass: ZPIdentityClientBaseTests.self,
                              originalSelector: #selector(getter: UIDevice.current.systemVersion),
                              swizzledSelector: #selector(getter: systemVersion),
                              revert: revert)

        swizzleClassMethod(originalClass: APKeychain.self,
                           swizzledClass: ZPIdentityClientBaseTests.self,
                           originalSelector: #selector(APKeychain.getStringForKey(_:)),
                           swizzledSelector: #selector(ZPIdentityClientBaseTests.getStringForKey(key:)),
                           revert: revert)

        swizzleInstanceMethod(originalClass: UIDevice.self,
                              swizzledClass: ZPIdentityClientBaseTests.self,
                              originalSelector: #selector(getter: UIDevice.current.userInterfaceIdiom),
                              swizzledSelector: #selector(getter: userInterfaceIdiom),
                              revert: revert)
    }

    override func setUp() {
        mock = MockZPIdentityClientBase().withEnabledSuperclassSpy()
        // Swizzle methods in setUP
        swizzleMethods()
    }

    override func tearDown() {
        // Swizzle back, swift does not know how to operate with multy swizzeling. To prevent it, revert swizzling each end of test cycle
        swizzleMethods(revert: true)
    }

    func testInitWithBucketID() {
        let identityClient = ZPIdentityClientBase(bucketID: "11111")
        XCTAssertEqual(identityClient.bucketID,
                       "11111")
    }

    func testDictFromData() {
        var dataDictMock: [String: Any] = ["1": "A",
                                           "2": "B"]
        var data = try! JSONSerialization.data(withJSONObject: dataDictMock,
                                               options: .prettyPrinted)
        var result = mock.dictFromData(data: data)!
        XCTAssertEqual(NSDictionary(dictionary: result),
                       NSDictionary(dictionary: dataDictMock))

        dataDictMock = ["1": 123,
                        "2": "B"]
        data = try! JSONSerialization.data(withJSONObject: dataDictMock,
                                           options: .prettyPrinted)
        result = mock.dictFromData(data: data)!
        XCTAssertEqual(NSDictionary(dictionary: result),
                       NSDictionary(dictionary: dataDictMock))

        XCTAssertNil(mock.dictFromData(data: nil))

        let dataArraMock: [Any] = ["1",
                                   "2"]
        data = try! JSONSerialization.data(withJSONObject: dataArraMock,
                                           options: .prettyPrinted)
        XCTAssertNil(mock.dictFromData(data: data))

        data = try! JSONSerialization.data(withJSONObject: dataArraMock,
                                           options: .prettyPrinted)
        XCTAssertNil(mock.dictFromData(data: Data()))
    }

    func testDefaultURLQueryItems() {
        let result = mock.defaultURLQueryItems
        XCTAssertEqual(result,
                       correctDefaultURLQueryItemsResult)
    }

    func testSessionURLQueryItems() {
        let result = mock.sessionURLQueryItems
        XCTAssertEqual(result,
                       correctDefaultURLQueryItemsResult + correctSessionItemsResult)
    }

    func testDeviceURLQueryItems() {
        let result = mock.deviceURLQueryItems
        XCTAssertEqual(result,
                       correctDefaultURLQueryItemsResult + correctDeviceItemsResult)
    }

    func testCreateDeviceURL() {
        stub(mock) { stub in
            when(stub.bucketID.get).thenReturn("11111")
        }

        let result = mock.createDeviceURL!
        let resultComponents = URLComponents(url: result,
                                             resolvingAgainstBaseURL: true)
        XCTAssertEqual(resultComponents?.path, "/ais.applicaster.com/api/v1/buckets/11111/devices.json")
        XCTAssertEqual(resultComponents?.queryItems,
                       mock.deviceURLQueryItems)
    }

    func testSessionURL() {
        stub(mock) { stub in
            when(stub.bucketID.get).thenReturn("11111")
        }

        let result = mock.sessionURL!
        let resultComponents = URLComponents(url: result,
                                             resolvingAgainstBaseURL: true)
        XCTAssertEqual(resultComponents?.path, "/ais.applicaster.com/api/v1/buckets/11111/sessions.json")
        XCTAssertEqual(resultComponents?.queryItems,
                       mock.sessionURLQueryItems)
    }

    func testIsRestMethodAvailible() {
        var result = mock.isRestMethodAvailible(method: "POST")
        XCTAssertTrue(result)

        result = mock.isRestMethodAvailible(method: "PUT")
        XCTAssertTrue(result)

        result = mock.isRestMethodAvailible(method: "DELETE")
        XCTAssertTrue(result)

        result = mock.isRestMethodAvailible(method: "")
        XCTAssertFalse(result)

        result = mock.isRestMethodAvailible(method: "post")
        XCTAssertFalse(result)

        result = mock.isRestMethodAvailible(method: "put")
        XCTAssertFalse(result)

        result = mock.isRestMethodAvailible(method: "delete")
        XCTAssertFalse(result)

        result = mock.isRestMethodAvailible(method: "13241")
        XCTAssertFalse(result)
    }

    func testCreateURLRequest() {
        stub(mock) { stub in
            when(stub.bucketID.get).thenReturn("11111")
        }

        let url = mock.sessionURL

        var result = mock.createURLRequest(from: url,
                                           method: "POST")
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.httpMethod, "POST")

        result = mock.createURLRequest(from: url,
                                       method: "PUT")
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.httpMethod, "PUT")

        result = mock.createURLRequest(from: url,
                                       method: "DELETE")
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.httpMethod, "DELETE")

        result = mock.createURLRequest(from: url,
                                       method: "wrong")
        XCTAssertNil(result)

        result = mock.createURLRequest(from: nil,
                                       method: "POST")
        XCTAssertNil(result)

        result = mock.createURLRequest(from: nil,
                                       method: "POST")
        XCTAssertNil(result)

        result = mock.createURLRequest(from: URL(string: ""),
                                       method: "POST")
        XCTAssertNil(result)
    }

    func testServerType() {
        XCTAssertEqual(ZPIdentityClientBase.serverType.serverURL, "https:/ais.applicaster.com/api/v1/")
        XCTAssertEqual(ZPIdentityClientBase.serverType.UUIDKey, "APUUID")
        XCTAssertEqual(ZPIdentityClientBase.serverType.tokenKey, "APToken")
    }
}
