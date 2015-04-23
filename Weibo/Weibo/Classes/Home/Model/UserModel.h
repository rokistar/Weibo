//
//  UserModel.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/**    string    友好显示名称*/
@property(nonatomic,copy)NSString *name;
/**string    用户头像地址（中图），50×50像素*/
@property(nonatomic,copy)NSString *profile_image_url;

//接口
+ (instancetype)userModelWithDict:(NSDictionary *)dict;

@end
