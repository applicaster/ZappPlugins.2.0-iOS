//
//  ZPFacebookProtocol.swift
//  ZappPlugins
//
//  Created by Alex Zchut on 04/08/2020.
//

import Foundation

@objc public protocol ZPFacebookProtocol {
    func setupFacebookSDK(withAppId appID: String?, displayName: String?)
    func requestPublishPermissions(_ publishPermission: [Any]?,
                                   completion: ((_ grantedPermission: Bool, _ error: Error?) -> Void)?)
    func getCurrentUser(_ completion: ((_ user: ZPFacebookUserProtocol?, _ error: Error?) -> Void)?)
    func authorizeFacebook(_ forced: Bool)
    func authorizeFacebook(_ forced: Bool,
                           readPermissions: [Any]?,
                           completion: ((_ loggedIn: Bool, _ error: Error?) -> Void)?)
    func getFacebookProfileImageUrlString(with profileID: String?, size: CGSize) -> String
    
    
    func getAccessToken() -> String?
    func getExpirationDate() -> Date?
    func getUserID() -> String?
    func getUserName() -> String?
    func getSessionPermissions() -> [Any]?
    func getSessionDeclinedPermissions() -> [Any]?
    func hasGrantedPermission(_ permission: String?) -> Bool
    func hasGrantedPermissions(_ permissions: [Any]?) -> Bool
    func isFacebookSessionValid() -> Bool
    func application(_ application:UIApplication?,
                     openURL: URL?,
                     sourceApplication: String?,
                     annotation: AnyObject?) -> Bool
    func share(from viewController: UIViewController?,
               url: URL?,
               title: String?,
               description: String?,
               imageUrl: URL?)
    func closeSession()
    func createUser(with dict: [AnyHashable : Any]?) -> ZPFacebookUserProtocol?
    func request(withPath path: String?,
                 params: NSMutableDictionary?,
                 httpMethod: String?,
                 completion: ((_ result: Any?, _ error: Error?) -> Void)?)
    
    func createComment(withText text: String?,
                 image: UIImage?,
                 postId: String?,
                 completion: ((_ resultCommentId: String?, _ error: Error?) -> Void)?)
    
    func createPost(withText text: String?,
                 image: UIImage?,
                 pageId: String?,
                 completion: ((_ resultPostId: String?, _ error: Error?) -> Void)?)
}

@objc public protocol ZPFacebookUserProtocol {
    var name: String? {get set}
    var objectID: String? {get set}
    var avatarImageUrl: String? {get set}
}
