# MultiConfig
iOS multi-environment configuration with multi lanes use fastlane.

##iOS multi-environment configuration
###1. 各个环境及功能定位🕸

|Configuration|模式|API Server|Provisioning Profiles|Lane✈️|
|:-------- | -------:| -------:| -------:| -------:|
|Debug|调试模式|Development|Development|Debug|
| Dev |开发模式|Development|Development| Dev |
| AdHoc |内部测试| Production | Distribution Ad Hoc | AdHoc |
| Beta |TestFlight| Production |Distribution Ad Hoc| Beta |
| Release |发布模式| Production | Distribution App Store |App Store|

`备注：【Debug模式】打包的时候不会出现这种模式`

详细.xconfig配置参照`xcconfigREADME.md`

###2. 各个环境中的配置⚙
* Build identifier（适用）
* Display name
* Icon
* API Server（适用）
* 支持webview页面跳转到本APP
	info.plist中需要设置如下参数：
	* APPBundleURLName 
	* APPBundleURLSchemes
* 第三方key（适用）
	* 分享、授权登录 
		* 微博
			* WBAPPKey
			* WBAPPScret
			* WBRedirectURL 
			* WBBundleURLName
			* WBBundleURLSchemes
		* 微信
			* WXAPPID
			* WXAPPScret 
			* WXBundleURLName
			* WXBundleURLSchemes
		* QQ
			* QQAPPID 
			* QQBundleURLName
			* QQBundleURLSchemes 
	* 推送 
		* 百度
		* 极光
	* 地图
		* 高德
		* 百度
	* 统计
		* 友盟
			* UMengAppKey 
		* Google Analytics
	* 语音
		* 讯飞 

###3. 配置步骤🐎
1. 添加configurations到Xcode工程中

	![Config-1](/Users/PURPLEPENG/Documents/Effective/Config-1.png)
2. 在build scheme中设置configuration
	
	![Config-2](/Users/PURPLEPENG/Documents/Effective/Config-2.png)
	![Config-3](/Users/PURPLEPENG/Documents/Effective/Config-3.png)
3. 创建多个.xcconfig文件

	![Config-4](/Users/PURPLEPENG/Documents/Effective/Config-4.png)
4. target中的每个build configuration指派一个.xcconfig文件
![Config-5](/Users/PURPLEPENG/Documents/Effective/Config-5.png)
5. 重写.xcconfig文件中变量的值
			
		APPBundleURLName = com.yourcompany.MultiConfigDemo
		APPBundleURLSchemes = MultiConfigDemo

		// 微博
		WBAPPKey = YourWBAPPKey(ProductEnvironment)
		WBAPPScret = YourWBAPPScret(ProductEnvironment)
		WBRedirectURL = YourWBRedirectURL(ProductEnvironment)
		
6. Info.plist文件中引用.xcconfig文件中定义的变量
	例如：
			
		<key>CFBundleName</key>
		<string>$(PRODUCT_NAME)</string>

		引用.xcconfig文件中定义的变量后：
		<key>CFBundleName</key>
		<string>$(CUSTOM_PRODUCT_NAME)</string> 

	如果项目中使用了第三方授权登录/分享，现在info.plist文件可以如下配置：
![Config-6](/Users/PURPLEPENG/Documents/Effective/Config-6.png)		

###4. 附录📖
####1. 添加 Build Phase
* 添加 Run Script Build Phase

####2. 添加 Build Setting
* 添加 User-Defined Setting

####3. Preprocessor Macros
Build Settings中定位到Preprocessor Macros，每个configuration添加
`CONFIGURATION_${CONFIGURATION}`
然后在代码中根据添加的宏判断configuration类型

		#if defined (CONFIGURATION_AdHoc) || defined (CONFIGURATION_Debug)
		  //Code placed here will only be compiled and thus
		  //included at runtime in AdHoc and Debug releases.
		#endif	


###5. Refrence🔗
* [firefox-ios](https://github.com/mozilla/firefox-ios)
* [iOS multi-environment configuration](http://appfoundry.be/blog/2014/07/04/Xcode-Env-Configuration/)

###6. TODO⚓️
* 如果让多个Configuration和fastlane中不同的lane对应？

之前的做法是，项目中配置多个target，每个target对应1个schema；然后不同的scheme对应不同的lane。
现在可以实现成：配置1个target，1个target对应多个Configuration；不同的Configuration对应不同的lane。
