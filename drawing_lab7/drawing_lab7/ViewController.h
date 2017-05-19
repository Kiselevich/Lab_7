//
//  ViewController.h
//  drawing_lab7
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Oleg Kiselevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *dataArray;
    NSString *colorString;
    NSString *size;
}

@end

