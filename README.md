# MultiConfig
iOS multi-environment configuration with multi lanes use [fastlane](https://github.com/fastlane/fastlane).

##iOS multi-environment configuration

###1. 各个环境及功能定位🕸

|Configuration|模式|API Server|Provisioning Profiles|Lane✈️|
|:-------- |:-------|:-------|:-------|:-------|
|Debug|调试模式|Development|Development|-|
| Dev |开发模式|Development|Development| Dev |
| AdHoc |内部测试| Production | Distribution Ad Hoc | AdHoc |
| Beta |TestFlight| Production |Distribution Ad Hoc| Beta |
| Release |发布模式| Production | Distribution App Store |App Store|

`备注：【Debug模式】打包的时候不会出现这种模式`

详细.xcconfig配置参照[xcconfigREADME.md](https://github.com/purplepeng/MultiConfig/blob/master/MultiConfigDemo/MultiConfigDemo/Configuration/README.md)

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

	![config-1](https://cloud.githubusercontent.com/assets/3256113/15461539/3ad28774-20ee-11e6-9a2a-3a02554f260d.png)
2. 在build scheme中设置configuration
	
	![config-2](https://cloud.githubusercontent.com/assets/3256113/15461542/3ad71c80-20ee-11e6-87e5-bd26cb66facf.png)
	![config-3](https://cloud.githubusercontent.com/assets/3256113/15461773/4546a008-20f0-11e6-8a57-79aaf39ad14f.png)
3. 创建多个.xcconfig文件

	![config-4](https://cloud.githubusercontent.com/assets/3256113/15461541/3ad5693a-20ee-11e6-8dc1-f547e48955f4.png)
4. target中的每个build configuration指派一个.xcconfig文件
![config-5](https://cloud.githubusercontent.com/assets/3256113/15461776/4db55f68-20f0-11e6-8018-7d0d0bb4655b.png)
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
![config-6](https://cloud.githubusercontent.com/assets/3256113/15461826/af1f14c4-20f0-11e6-9276-4631040408a1.png)	
	如果想着项目代码中引用第三方相关key，info.plist文件需要添加如下设置：
![config-8](https://cloud.githubusercontent.com/assets/3256113/15461839/d263fe04-20f0-11e6-95cc-92984adae7bc.png)	
7. 不同的Configuration对应不同的lane
	* 初始化[fastlane](https://github.com/fastlane/fastlane)
	
	
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
现在的实现是：配置1个target，1个target对应多个Configuration；不同的Configuration对应不同的lane。

|Configuration|scheme|Lane✈️|
|:--------|:-------| :-------|
| Dev | MultiConfigDemo Dev| Dev |
| AdHoc |MultiConfigDemo AdHoc| AdHoc |
| Beta |MultiConfigDemo Beta | Beta |
| Release | MultiConfigDemo Release |App Store|
