//
//  ImageItemView.m
//  Weibo
//
//  Created by Roki on 4/28/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ImageItemView.h"
#import "HttpTool.h"


@interface ImageItemView (){
    UIImageView *_gifView;

}
@end

@implementation ImageItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif.png"]];
        [self addSubview:gifView];
        _gifView = gifView;
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    // 1.设置gifView的位置
    CGRect gifFrame = _gifView.frame;
    gifFrame.origin.x = frame.size.width - gifFrame.size.width;
    gifFrame.origin.y =  frame.size.height - gifFrame.size.height;
    _gifView.frame = gifFrame;
    
    [super setFrame:frame];
}

-(void)setUrl:(NSString *)url{
    _url = url;
    // 1.加载图片
    [HttpTool downloadImage:url place:[UIImage imageNamed:@"timeline_image_loading.png"] imageView:self];
    // 2.是否为gif
    _gifView.hidden = ![url.lowercaseString hasSuffix:@"gif"];
}

@end
