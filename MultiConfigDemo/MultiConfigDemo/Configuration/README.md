##xcconfig文件

###1. 概述
一个xcconfig文件被用作某个指定的build configuration的补充文件。一个build configuration可以用一个关联的xcconfig文件，这使得在Xcode project editor之外可以对 target's build做额外的修改。

###2. 用法
1. `#include "xx.xcconfig"` 声明
	
	由于Xcode限制每个target中的每个build configuration只能有指定一个xcconfig文件，你可以在你的xcconfig文件中从其他xcconfig文件引入其他设置。通过`#include “path/xx.xcconfig”`声明引入其他xcconfig文件
	
	```
	#include "Debug.xcconfig"	
	#include"Shared.xcconfig"
	```

2. 变量赋值
	* 重写

	通过给xcconfig中变量重新赋值，使得Project或Target上设置的Build setting 变量可以被重写。
	
		// Variable set in the project file
		OTHER_LDFLAGS = -ObjC
		
		// lib.xcconfig
		OTHER_LDFLAGS = -framework Security
		
	编译时, `OTHER_LDFLAGS`的值`-ObjC`会被新的值`-framework Security `重写。
	
	* 继承
		
	举例如下：
							
		// Variable set in the project file
			OTHER_LDFLAGS = -ObjC						
		// lib.xcconfig
		OTHER_LDFLAGS = $(inherited) -framework Securit
	编译时，`OTHER_LDFLAGS`的值会变成`-ObjC -framework Security`	
3. 变量替换
	
	变量赋值不局限与值，你可以引用在赋值中的其他变量的值。有两种引用其他变量的方式：

	对于变量`FOO`
	* $(FOO)
	* ${FOO}
	
	两种方式对所有变量都是可互换的，包括特殊的`$(inherited)`变量
	
	例如：

		HELLO = hello
		WORLD = world
		FOO = $(HELLO) ${WORLD} // The value of FOO is "hello world"	

###3. 项目中用到的xcconfig文件

####1. DevelopmentBase.xcconfig
	开发环境相关的配置
		* 第三方key	
####2. ProductBase.xcconfig
	生产环境相关的配置
		* 第三方key
####3. Debug.xcconfig
引入了DevelopmentBase.xcconfig文件

	* 调试模式
	* Development（Provisioning Profiles） 备注：打包的时候不会出现这种模式
	* Development(API Server)
####4. Dev.xcconfig
引入了DevelopmentBase.xcconfig文件

	* 开发模式
	* Development（Provisioning Profiles） 
	* Development(API Server)
####5. AdHoc.xcconfig
引入了ProductBase.xcconfig文件

	* Distribution Ad Hoc（Provisioning Profiles） 
	* Production(API Server)
####6. Beta.xcconfig
引入了ProductBase.xcconfig文件

	* 内部测试（TestFlight）
	* Distribution Ad Hoc（Provisioning Profiles） 
	* Production(API Server)
####7. Release.xcconfig
引入了ProductBase.xcconfig文件

	* 发布模式
	* Distribution App Store（Provisioning Profiles） 
	* Production(API Server)

	
###4. Refrence
* [The Unofficial Guide to xcconfig files](http://pewpewthespells.com/blog/xcconfig_guide.html#BuildSettingInheritance)
* [xcconfigs](https://github.com/jspahrsummers/xcconfigs)	