//
//  ZoomViewController.m
//  ScrollViewImageGallerys
//
//  Created by Alex on 2015-11-02.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewZoom;
@property (weak, nonatomic) IBOutlet UIImageView *imageZoom;

@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageZoom.image = self.currentImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageZoom;
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
