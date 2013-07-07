//
//  DemPicks3ViewController.m
//  DemPicks2
//
//  Created by Ryan Hestin on 7/6/13.
//  Copyright (c) 2013 Ryan Hestin. All rights reserved.
//

#import "DemPicks3ViewController.h"

@interface DemPicks3ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Arrow1;
@property (weak, nonatomic) IBOutlet UILabel *Arrow2;
@property (weak, nonatomic) IBOutlet UILabel *Arrow3;



@end

@implementation DemPicks3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Arrow1.enabled = false;
    self.Arrow2.enabled = false;
    self.Arrow3.enabled = false;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    self.Arrow1.enabled = false;
    self.Arrow2.enabled = false;
    self.Arrow3.enabled = false;
    
}

- (IBAction)RandomizeArrow:(id)sender {
    self.Arrow1.enabled = false;
    self.Arrow2.enabled = false;
    self.Arrow3.enabled = false;
    
    unsigned index = arc4random() % 3;
    
    switch (index) {
        case 0:
            self.Arrow1.enabled = true;
            break;
        case 1:
            self.Arrow2.enabled = true;
            break;
        case 2:
            self.Arrow3.enabled = true;
            break;
        default:
            break;
    }

}


@end
