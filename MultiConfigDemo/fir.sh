#!/bin/sh

#  export.sh
#  
#
#  Created by PURPLEPENG on 8/13/15.
#


#pwd
#切换到目标目录
cd ..
#pwd

#发布应用到fir.im

#发布应用到fir.im(配置生成的ipa名和fir.im API  Token)
fir p ./YOUR_PRODUCT.ipa -T YOUR_FIR_TOKEN
# fir p ./$PROJECT_NAME.ipa -T $FIR_TOKEN
