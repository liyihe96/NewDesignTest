//
//  PageContentViewController.m
//  NewDesignTest
//
//  Created by Yihe Li on 11/13/14.
//  Copyright (c) 2014 Yihe Li. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentLabel.text = self.content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
