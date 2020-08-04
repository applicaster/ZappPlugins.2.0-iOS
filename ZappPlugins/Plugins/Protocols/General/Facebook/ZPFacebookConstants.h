//
//  ZPFacebookConstants.h
//  ZappPlugins
//
//  Created by Alex Zchut on 04/08/2020.
//

/** A notification using this name is used to pass on a dictionary of paramaters, to allow calling <openFeedWithDictionary:>. The parameters should be stored as the <code>userInfo</code> of the notification. */
extern NSString * _Nonnull const APFacebookOpenFeedNotification;
/** This notification is called when the facebook feed dialog is successfully sent. */
extern NSString * _Nonnull const APFacebookFeedSentNotification;
/** This notification is called when the facebook feed dialog is opened. */
extern NSString * _Nonnull const APFacebookFeedDidOpenNotification;
/** This notification is called when the facebook feed dialog is closed, regardless of the result. */
extern NSString * _Nonnull const APFacebookFeedDidCloseNotification;
/** This notification is sent when facebook did Login */
extern NSString * _Nonnull const APFacebookDidLoginNotification;
/** This notification is sent when facebook did Logout */
extern NSString * _Nonnull const APFacebookDidLogoutNotification;
/** This notification is sent when facebook didn't manage to Login */
extern NSString * _Nonnull const APFacebookDidNotLoginNotification;
extern NSString * _Nonnull const APFacebookSessionStateChangedNotification;
