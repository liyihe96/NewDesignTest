//
//  CustomTableViewCell.m
//  NewDesignTest
//
//  Created by Yihe Li on 11/13/14.
//  Copyright (c) 2014 Yihe Li. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.comments = @[@"First Test", @"Second Test", @"Third Test"];
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.dataSource = self;
    PageContentViewController *firstVC = [self viewcontrollerAtIndex:0];
    NSArray *controllers = @[firstVC];
    [self.pageVC setViewControllers:controllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self.pageVC.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
    [self.contentView insertSubview:self.pageVC.view belowSubview:self.commentButton];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Page View Controller Datasource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController*) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index ++;
    if (index == self.comments.count) {
        return nil;
    }
    return [self viewcontrollerAtIndex: index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController *)viewController).pageIndex;
    if (index == 0|| index == NSNotFound) {
        return nil;
    }
    return [self viewcontrollerAtIndex: index -1];
}

- (UIViewController *)viewcontrollerAtIndex:(NSInteger) index
{
    if (self.comments.count == 0|| index >= self.comments.count) {
        return nil;
    }
    
    PageContentViewController *pageContentVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentVC.pageIndex = index;
    pageContentVC.content = self.comments[index];
    return pageContentVC;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.comments count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
