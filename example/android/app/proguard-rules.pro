# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/Cellar/android-sdk/24.3.3/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:
-dontobfuscate
-dontwarn com.squareup.picasso.OkHttpDownloader
-dontwarn com.google.api.client.googleapis.testing.TestUtils
-dontwarn java.nio.file.*
-dontwarn java.lang.invoke.*
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn java.lang.reflect.Method
-dontwarn com.comscore.instrumentation.InstrumentedMapActivity
-dontwarn org.apache.http.entity.mime.content.FileBody
-dontwarn org.apache.http.entity.mime.AbstractMultipartForm
-dontwarn org.apache.http.entity.mime.FormBodyPart
-dontwarn org.apache.http.entity.mime.FormBodyPartBuilder
-dontwarn org.apache.http.entity.mime.MIME
-dontwarn org.apache.http.entity.mime.MultipartEntityBuilder
-dontwarn org.apache.http.entity.mime.MultipartFormEntity
-dontwarn org.apache.http.entity.mime.content.AbstractContentBody
-dontwarn org.apache.http.entity.mime.content.ByteArrayBody
-dontwarn org.apache.http.entity.mime.content.InputStreamBody
-dontwarn org.apache.http.entity.mime.content.StringBody
-dontwarn org.apache.**
-dontwarn android.view.autofill.AutofillManager
-dontwarn javax.imageio.ImageIO
-dontwarn java.awt.image.BufferedImage
-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
-keep interface com.yalantis.ucrop** { *; }
-keep class * implements com.coremedia.iso.boxes.Box { *; }
-dontwarn com.coremedia.iso.boxes.**
-dontwarn com.googlecode.mp4parser.authoring.tracks.mjpeg.**
-dontwarn com.googlecode.mp4parser.authoring.tracks.ttml.**
-dontwarn com.akexorcist.roundcornerprogressbar.TextRoundCornerProgressBar
-dontwarn com.android.installreferrer.api.*
-keepattributes *Annotation*
-keepclassmembers class * {
        @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }
-keepclassmembers,allowobfuscation class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-dontwarn kotlinx.coroutines.flow.**
-dontwarn org.reactivestreams.FlowAdapters
-dontwarn org.reactivestreams.**
-dontwarn java.util.concurrent.flow.**
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembernames class kotlinx.** {
        volatile <fields>;
}
-keep class org.json.** { *; }
-keep class org.ccil.cowan.tagsoup** { *; }
# Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
# EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod
# Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
        @retrofit2.http.* <methods>;
}
# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**
# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit
# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*
# With R8 full mode, it sees no subtypes of Retrofit interfaces since they are created with a Proxy
# and replaces all potential values with null. Explicitly keeping the interfaces prevents this.
-if interface * { @retrofit2.http.* <methods>; }
-keep,allowobfuscation interface <1>
-keep class retrofit2.** { *; }
#Flyy sdk
-keep public class theflyy.com.flyy.** {*;}
