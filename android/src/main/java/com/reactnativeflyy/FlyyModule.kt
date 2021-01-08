package com.reactnativeflyy

import android.content.Context
import android.content.Intent
import com.facebook.react.bridge.*
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject
import theflyy.com.flyy.Flyy
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
  fun initSDK(partnerToken: String?, environment: Int) {
    Flyy.init(context, partnerToken, environment)
  }

  @ReactMethod
  fun setUser(externalUserId: String?) {
    Flyy.setUser(externalUserId)
  }

  @ReactMethod
  fun setUserWithCallBack(externalUserId: String?, successCallBack: Callback) {
    Flyy.setUser(externalUserId) {
      successCallBack.invoke("Success")
      //        map.putString("message", "Success");
//        promise.resolve(map);
    }
  }

  @ReactMethod
  fun setNewUser(externalUserId: String?) {
    Flyy.setNewUser(externalUserId)
  }

  @ReactMethod
  fun setNewUserWithCallBack(externalUserId: String?, successCallBack: Callback) {
    Flyy.setNewUser(externalUserId) {
      successCallBack.invoke("Success")
      //        map.putString("message", "Success");
//        promise.resolve(map);
    }
  }

  @ReactMethod
  fun setUserName(userName: String?) {
    Flyy.setUsername(userName)
  }

  @ReactMethod
  fun setUserNameWithCallBack(userName: String?, successCallBack: Callback) {
    Flyy.setUsername(userName) {
      successCallBack.invoke("Success")
      //        map.putString("message", "Success");
//        promise.resolve(map);
    }
  }

  private fun openFlyyRouteActivity(pageToOpen: String) {
    val startOffersActivity = Intent(context, FlyyRouteActivity::class.java)
    startOffersActivity.putExtra(FlyyRouteActivity.PAGE_TO_OPEN, pageToOpen)
    startOffersActivity.flags = Intent.FLAG_ACTIVITY_NEW_TASK
    context!!.startActivity(startOffersActivity)
  }

  @ReactMethod
  fun openOffersScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_OFFERS_PAGE)
  }

  @ReactMethod
  fun openRewardsScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_REWARDS_PAGE)
  }

  @ReactMethod
  fun openWalletScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_WALLET_PAGE)
  }

  @ReactMethod
  fun openGiftCardScreen() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_GIFT_CARDS_PAGE)
  }

  @ReactMethod
  fun openReferralHistory() {
    openFlyyRouteActivity(FlyyRouteActivity.FLYY_REFERRAL_HISTORY_PAGE)
  }

  @ReactMethod
  fun sendEvent(key: String?, value: String?) {
    Flyy.sendEvent(key, value)
  }

  @ReactMethod
  fun sendEvent(key: String?, readableMap: ReadableMap?) {
    try {
      convertMapToJson(readableMap)
      Flyy.sendEvent(key, convertMapToJson(readableMap))
    } catch (e: JSONException) {
      e.printStackTrace()
    }
  }

  @ReactMethod
  fun sendEventWithCallBack(key: String?, value: String?, successCallBack: Callback) {
    Flyy.sendEvent(key, value) {
      successCallBack.invoke("Success")
      //        map.putString("message", "Success");
//        promise.resolve(map);
    }
  }

  @ReactMethod
  fun sendEventWithCallBack(key: String?, readableMap: ReadableMap?,
                            successCallBack: Callback) {
    try {
      convertMapToJson(readableMap)
      Flyy.sendEvent(key, convertMapToJson(readableMap), OnFlyyTaskComplete {
        successCallBack.invoke("Success")
        //          map.putString("message", "Success");
//          promise.resolve(map);
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
