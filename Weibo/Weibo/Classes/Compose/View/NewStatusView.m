//
//  NewStatusView.m
//  Weibo
//
//  Created by Roki on 4/22/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "NewStatusView.h"


@interface NewStatusView(){
    UILabel *_placehoderLabel;
}
@end

@implementation NewStatusView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UILabel *placehoderLabel = [[UILabel alloc]init];
        placehoderLabel.numberOfLines = 0;
        placehoderLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:placehoderLabel];
        _placehoderLabel = placehoderLabel;
        
        self.placehoderColor = [UIColor lightGrayColor];
        
        self.font = [UIFont systemFontOfSize:14];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange{
    if(self.text.length == 0){
        _placehoderLabel.hidden = NO;
    }else{
        _placehoderLabel.hidden = YES;
    }
    _placehoderLabel.hidden = (self.text.length != 0);
}
#pragma mark 设置占位字符
- (void)setPlacehoder:(NSString *)placehoder{
    _placehoder = [placehoder copy];
    _placehoderLabel.text = placehoder;
    
    [self setNeedsLayout];
}
- (void)setPlacehoderColor:(UIColor *)placehoderColor{
    _placehoderColor = placehoderColor;
    _placehoderLabel.textColor = placehoderColor;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
 
    
    // 根据文字计算label的高度
    CGSize maxSize = CGSizeMake(_placehoderLabel.frame.size.width, MAXFLOAT);
    CGSize placehoderSize = [self.placehoder sizeWithFont:_placehoderLabel.font constrainedToSize:maxSize];
    CGRect frame = _placehoderLabel.frame;
    frame = CGRectMake(5, 8, 200, placehoderSize.height);
    
    _placehoderLabel.frame = frame;
    
    


    
}
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    _placehoderLabel.font = font;
    [self setNeedsLayout];
    
}
- (void)setText:(NSString *)text{
    [super setText:text];
   }
@end
