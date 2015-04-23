//
//  ComposeController.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ComposeController.h"
#import "UIColor+RGB.h"
#import "UIBarButtonItem+Icon.h"
#import "ComposeToolBar.h"
#import "ComposePhotoView.h"



@interface ComposeController ()< UITextViewDelegate,ComposeToolBarDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
   // NewStatusView *_textView;
    
    ComposeToolBar *_toolBar;
    ComposePhotoView *_photoView;
    
    
}

@end

@implementation ComposeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.hidden = YES;

    [self buildUI];
    [self addTextView];
    [self addComposeToolBar];
    [self addPhotoView];
    
}
- (void)buildUI{
    // 1.设置标题
    self.title = @"New Weibo";
    
    // 2.左边的item

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(backMainController)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];
    // 3.右边的item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleBordered target:self action:@selector(sendStatus)];
  
}
- (void)addTextView{
    NewStatusView *textView = [[NewStatusView alloc]init];
    textView.frame = self.view.bounds;
    [self.view addSubview:textView];
    
    textView.placehoder = @"What's on your mind?";
 
    textView.font = [UIFont systemFontOfSize:15];
    textView.placehoderColor = [UIColor lightGrayColor];
    self.textView = textView;
 
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)addComposeToolBar{
    ComposeToolBar *toolBar=[[ComposeToolBar alloc]init];
    toolBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    toolBar.delegate = self;
    _toolBar = toolBar;
    self.textView.inputAccessoryView=toolBar;
    
}
#pragma mark - 键盘处理
//-(void)KeyboardWillShow:(NSNotification *)note{
//    CGFloat duration=[note.userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    //2.动画
//    [UIView animateWithDuration:duration animations:^{
//        //取出键盘的高度
//        CGRect keyboardF=[note.userInfo [UIKeyboardFrameEndUserInfoKey] CGRectValue];
//        CGFloat keyboardH=keyboardF.size.height;
//        NSLog(@"aa-%f",keyboardH);
//
//        _toolBar.transform=CGAffineTransformMakeTranslation(0, -keyboardH);
//    }];
//   }
//-(void)KeyboardWillHide:(NSNotification *)note{
//    //1.键盘弹出需要的时间
//    CGFloat duration=[note.userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    //2.动画
//    [UIView animateWithDuration:duration animations:^{
//        
//        _toolBar.transform=CGAffineTransformIdentity;
//           NSLog(@"%f",_toolBar.frame.origin.y);
//        
//    }];
//}
- (void)sendStatus{
    NSLog(@"test");
}
- (void)backMainController{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)composeToolBar:(id)item click:(ComposeToolBarButtonType)type{
    NSLog(@"%u",type);
    switch (type) {
        case kComposeToolBarButtonTypePicture:
            [self openAlbum];
            break;
        case kComposeToolBarButtonTypeEmotion:
            NSLog(@"Emotion");
            break;
        case kComposeToolBarButtonTypeLocation:
            NSLog(@"location");
            break;
        case kComposeToolBarButtonTypeAdd:
            NSLog(@"add");
            break;
        case kComposeToolBarButtonTypeCamera:
            NSLog(@"Camera");
            break;
        case kComposeToolBarButtonTypeMention:
            NSLog(@"Mention");
            break;
        case kComposeToolBarButtonTypeTrend:
            NSLog(@"Trend");
            break;
            
        default:
            break;
    }
}
- (void)addPhotoView{
    ComposePhotoView *photoView = [[ComposePhotoView alloc]init];
    CGFloat h = self.textView.frame.size.height;
    CGFloat w = self.textView.frame.size.width;
    photoView.frame = CGRectMake(60, 50, w,h);
    _photoView = photoView;
}
- (void)openAlbum{
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //1,取出选取的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //2,添加图片到相册中
    [_photoView addImage:image];
}
@end
