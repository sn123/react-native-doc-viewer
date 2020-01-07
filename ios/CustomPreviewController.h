//
//  CustomPreviewController.h
//  RNReactNativeDocViewer
//
//  Created by Sheethal on 07/01/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <QuickLook/QuickLook.h>

@interface CustomPreviewController : QLPreviewController
@property (strong, nonatomic) NSString* hideShareButton;

@end
