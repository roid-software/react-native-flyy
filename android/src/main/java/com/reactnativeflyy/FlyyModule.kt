package com.reactnativeflyy

import android.content.Context
import android.content.Intent
import com.facebook.react.bridge.*
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject
import theflyy.com.flyy.Flyy
import theflyy.com.flyy.helpers.FlyyReferrerDataListener
import theflyy.com.flyy.helpers.OnFlyyTaskComplete
import java.util.*


class FlyyModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  private var context: Context? = reactContext.applicationContext

  var STAGE = "STAGE"
  var PRODUCTION = "PRODUCTION"

  var map = Arguments.createMap()

  override fun getName(): String {
    return "Flyy"
  }

  init {
    context = reactContext.applicationContext
  }

  @ReactMethod
  fun setPackageName(packageName: String) {
    Flyy.setPackageName(packageName)
  }

  @ReactMethod
  fun initSDK(partnerToken: String?, environment: Int) {
    Flyy.init(context, partnerToken, environment)
  }

  @ReactMethod
  fun initSDKWithReferralCallback(partnerToken: String?, environment: Int, referralCallBack: Callback) {
    Flyy.init(context, partnerToken, environment, FlyyReferrerDataListener { referrerData ->
      referralCallBack.invoke(referrerData)
    })
  }

  @ReactMethod
  fun initSDKWithThemeColors(partnerToken: String?, environment: Int, colorPrimary: String?, colorPrimaryDark: String?) {
    Flyy.init(context, partnerToken, environment, colorPrimary, colorPrimaryDark)
  }

  @ReactMethod
  fun setNewUser(externalUserId: String?) {
    Flyy.setNewUser(externalUserId)
  }

  @ReactMethod
  fun setNewUserWithCallBack(externalUserId: String?, successCallBack: Callback) {
    Flyy.setNewUser(externalUserId, OnFlyyTaskComplete {
      successCallBack.invoke("success")
    })
  }

  @ReactMethod
  fun setNewUserWithSegment(externalUserId: String?, segmentId: String?, successCallBack: Callback) {
    Flyy.setNewUser(externalUserId, segmentId, OnFlyyTaskComplete {
      successCallBack.invoke("success")
    })
  }

  @ReactMethod
  fun setUser(externalUserId: String?) {
    Flyy.setUser(externalUserId)
  }

  @ReactMethod
  fun setUserWithCallBack(externalUserId: String?, successCallBack: Callback) {
    Flyy.setUser(externalUserId, OnFlyyTaskComplete {
      successCallBack.invoke("success")
    })
  }

  @ReactMethod
  fun setUserWithSegment(externalUserId: String?, segmentId: String?, successCallBack: Callback) {
    Flyy.setUser(externalUserId, segmentId, OnFlyyTaskComplete {
      successCallBack.invoke("success")
    })
  }

  @ReactMethod
  fun setUserName(userName: String?) {
    Flyy.setUsername(userName)
  }

  @ReactMethod
  fun setUserNameWithCallBack(userName: String?, successCallBack: Callback) {
    Flyy.setUsername(userName, OnFlyyTaskComplete { successCallBack.invoke("success") })
  }

  @ReactMethod
  fun setRedemptionDetails(accountType: String?, accountNumber: String?, ifscCode: String?, name: String?,
                           upiId: String?) {
    Flyy.setRedemptionDetails(accountType, accountNumber, ifscCode, name, upiId)
  }

  @ReactMethod
  fun setBankDetails(accountNumber: String?, ifscCode: String?, name: String?) {
    Flyy.setBankDetails(accountNumber, ifscCode, name)
  }

  @ReactMethod
  fun setUPIDetails(upiId: String?) {
    Flyy.setUPI(upiId)
  }

  @ReactMethod
  fun addUserToSegment(segmentTitle: String?, segmentKey: String?) {
    Flyy.addUserToSegment(segmentTitle, segmentKey);
  }

  @ReactMethod
  fun showNotificationPopup(notificationId: Int, title: String?, message: String?,
                            bigImage: String?, deeplink: String?, campaignId: Int) {
    Flyy.showPopup(context, notificationId, title, message, bigImage, deeplink, campaignId)
  }

  @ReactMethod
  fun logout() {
    Flyy.logout(context)
  }

  @ReactMethod
  fun setReferralCode(referralCode: String?) {
    Flyy.setReferrerCode(referralCode)
  }

  @ReactMethod
  fun setSegmentId(segmentId: String?) {
    Flyy.segmentId = segmentId
  }

  private fun openFlyyRouteActivity(pageToOpen: String, segmentId: String?) {
    val startOffersActivity = Intent(context, FlyyRouteActivity::class.java)
    startOffersActivity.putExtra(FlyyRouteActivity.PAGE_TO_OPEN, pageToOpen)
    startOffersActivity.putExtra(FlyyRouteActivity.SEGMENT_ID, segmentId)
    startOffersActivity.flags = Intent.FLAG_ACTIVITY_NEW_TASK
    context!!.startActivity(startOffersActivity)
  }

  @ReactMethod
  fun openOffersScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_OFFERS_PAGE, null)
  }

  @ReactMethod
  fun openOffersScreenWithSegment(segmentId: String?) {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_OFFERS_PAGE, segmentId)
  }

  @ReactMethod
  fun openRewardsScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_REWARDS_PAGE, null)
  }

  @ReactMethod
  fun openWalletScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_WALLET_PAGE, null)
  }

  @ReactMethod
  fun openGiftCardScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_GIFT_CARDS_PAGE, null)
  }

  @ReactMethod
  fun openReferralHistory() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_REFERRAL_HISTORY_PAGE, null)
  }

  @ReactMethod
  fun openFlyyQuizPage() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_QUIZ_PAGE, null)
  }

  @ReactMethod
  fun openFlyyQuizHistoryPage() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_QUIZ_HISTORY_PAGE, null)
  }

  @ReactMethod
  fun openFlyyQuizListPage() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_QUIZ_LIST_PAGE, null)
  }

  @ReactMethod
  fun openFlyyStampsPage() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_STAMPS_PAGE, null)
  }

  @ReactMethod
  fun sendEvent(key: String?, value: String?) {
    Flyy.sendEvent(key, value)
  }

  @ReactMethod
  fun sendEvent(key: String?, readableMap: ReadableMap?) {
    try {
      Flyy.sendEvent(key, convertMapToJson(readableMap))
    } catch (e: JSONException) {
      e.printStackTrace()
    }
  }

  @ReactMethod
  fun sendEventWithCallBack(key: String?, value: String?, successCallBack: Callback) {
    Flyy.sendEvent(key, value, OnFlyyTaskComplete {
      successCallBack.invoke("success")
    })
  }

  @ReactMethod
  fun sendEventWithCallBack(key: String?, readableMap: ReadableMap?,
                            successCallBack: Callback) {
    try {
      Flyy.sendEvent(key, convertMapToJson(readableMap), OnFlyyTaskComplete {
        successCallBack.invoke("success")
      })
    } catch (e: JSONException) {
      e.printStackTrace()
    }
  }

  @Throws(JSONException::class)
  private fun convertMapToJson(readableMap: ReadableMap?): JSONObject? {
    val `object` = JSONObject()
    val iterator = readableMap!!.keySetIterator()
    while (iterator.hasNextKey()) {
      val key: String = iterator.nextKey()
      when (readableMap.getType(key)) {
        ReadableType.Null -> `object`.put(key, JSONObject.NULL)
        ReadableType.Boolean -> `object`.put(key, readableMap.getBoolean(key))
        ReadableType.Number -> `object`.put(key, readableMap.getDouble(key))
        ReadableType.String -> `object`.put(key, readableMap.getString(key))
        ReadableType.Map -> `object`.put(key, convertMapToJson(readableMap.getMap(key)))
        ReadableType.Array -> `object`.put(key, convertArrayToJson(readableMap.getArray(key)))
      }
    }
    return `object`
  }

  @Throws(JSONException::class)
  private fun convertArrayToJson(readableArray: ReadableArray?): JSONArray? {
    val array = JSONArray()
    for (i in 0 until readableArray!!.size()) {
      when (readableArray.getType(i)) {
        ReadableType.Null -> {
        }
        ReadableType.Boolean -> array.put(readableArray.getBoolean(i))
        ReadableType.Number -> array.put(readableArray.getDouble(i))
        ReadableType.String -> array.put(readableArray.getString(i))
        ReadableType.Map -> array.put(convertMapToJson(readableArray.getMap(i)))
        ReadableType.Array -> array.put(convertArrayToJson(readableArray.getArray(i)))
      }
    }
    return array
  }

  override fun getConstants(): Map<String, Any>? {
    val constants: MutableMap<String, Any> = HashMap()
    constants[STAGE] = Flyy.STAGE
    constants[PRODUCTION] = Flyy.PRODUCTION
    return constants
  }
}
