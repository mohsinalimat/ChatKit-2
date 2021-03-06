//
//  ChatCollectionViewController+Helper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "ChatCollectionViewController+Helper.h"
#import "MapLocationController.h"
#import <NSData+ImageContentType.h>

@implementation ChatCollectionViewController (Helper)



- (void)pickerPhotoComplection:(DidFinishTakeMediaCompletionBlock)completion
{
    [[CameraHelper helper]showPickerViewControllerSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum onViewController:self completion:^(MediaType mediaType, NSData *data) {
        
        completion ? completion(mediaType,data) : nil;
    }];
}


- (void)takePhotoOrVideoComplection:(DidFinishTakeMediaCompletionBlock)completion
{
    [[CameraHelper helper]showPickerViewControllerSourceType:UIImagePickerControllerSourceTypeCamera onViewController:self completion:^(MediaType mediaType, NSData *data) {
        
        completion ? completion(mediaType,data) : nil;
        
    }];
}



- (void)locationMapComplection:(void(^)(NSString *address,CLLocation *location,UIImage *locationPhoto, NSError *error))completion
{
    
    MapLocationController *mapLocation = [[MapLocationController alloc]init];
    [mapLocation setCompletion:^(NSString *address,CLLocation *location,UIImage *locationPhoto,NSError *error) {
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        completion ? completion(address,location,locationPhoto,error): nil;
        
    }];
    
    [self.navigationController pushViewController:mapLocation animated:YES];
    
}






@end
