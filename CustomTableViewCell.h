//
//  CustomTableViewCell.h
//  NewDesignTest
//
//  Created by Yihe Li on 11/13/14.
//  Copyright (c) 2014 Yihe Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface CustomTableViewCell : UITableViewCell<UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *comments; // array of comments
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end
