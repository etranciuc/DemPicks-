//
//  DemPicksViewController.m
//  Dem Picks!
//
//  Created by Ryan Hestin on 7/12/13.
//  Copyright (c) 2013 Ryan Hestin. All rights reserved.
//

#import "DemPicksViewController.h"

@interface DemPicksViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Arrow1;
@property (weak, nonatomic) IBOutlet UILabel *Arrow2;
@property (weak, nonatomic) IBOutlet UILabel *Arrow3;
@property (weak, nonatomic) IBOutlet UILabel *Arrow4;

@property (weak, nonatomic) IBOutlet UITextField *Label1;
@property (weak, nonatomic) IBOutlet UITextField *Label2;
@property (weak, nonatomic) IBOutlet UITextField *Label3;
@property (weak, nonatomic) IBOutlet UITextField *Label4;

@property (weak, nonatomic) IBOutlet UIStepper *ChoiceStepper;


@end

@implementation DemPicksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ArrowRandomizer:(id)sender {
        
    int randomInt = 2;
    
    if (!self.Label3.hidden) {
        randomInt++;
    }
    if (!self.Label4.hidden) {
        randomInt++;
    }
    
    
    //CHECK TO MAKE SURE ALL FIELDS HAVE TEXT   
    
    if((!self.Label1.hidden && [self.Label1.text isEqualToString:@""]) || (!self.Label2.hidden && [self.Label2.text isEqualToString:@""]) || (!self.Label3.hidden && [self.Label3.text isEqualToString:@""]) || (!self.Label4.hidden && [self.Label4.text isEqualToString:@""])){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WAIT!" message:@"Please fill in all choices or use the Stepper to change how many choices to pick from!" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    //////////////////////////////////////////
    
    
    self.Arrow1.hidden = YES;
    self.Arrow2.hidden = YES;
    self.Arrow3.hidden = YES;
    self.Arrow4.hidden = YES;
    
    int pick = arc4random()%randomInt;
    NSString *pickedText = [[NSString alloc] init];
    
    //NSLog(@"%d", pick);
    if(pick == 0){
        self.Arrow1.hidden = NO;
        pickedText = self.Label1.text;
    }
    if(pick == 1){
        self.Arrow2.hidden = NO;
        pickedText = self.Label2.text;
    }
    if(pick == 2){
        self.Arrow3.hidden = NO;
        pickedText = self.Label3.text;
    }
    if(pick == 3){
        self.Arrow4.hidden = NO;
        pickedText = self.Label4.text;
    }
    
    
    pickedText = [pickedText stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[pickedText substringToIndex:1] uppercaseString]];
    pickedText = [pickedText stringByReplacingCharactersInRange:NSMakeRange(1,pickedText.length-1) withString:[[pickedText substringWithRange:NSMakeRange(1, pickedText.length-1)] lowercaseString]];
    NSString *messageString = [[NSString alloc] initWithFormat:@"You got Choice %d: %@!", pick+1, pickedText];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:messageString delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alert show];
    
}

- (IBAction)UpdateChoiceField{
    int stepCount = self.ChoiceStepper.value;
    
    if(stepCount == 2.0){
        self.Arrow1.hidden = NO;
        self.Arrow2.hidden = NO;
        self.Arrow3.hidden = YES;
        self.Label3.hidden = YES;
        self.Label3.text = @"";
        self.Arrow4.hidden = YES;
        self.Label4.hidden = YES;
        self.Label4.text = @"";
    }
    if(stepCount == 3.0){
        self.Arrow1.hidden = NO;
        self.Arrow2.hidden = NO;
        self.Arrow3.hidden = NO;
        self.Label3.hidden = NO;
        self.Arrow4.hidden = YES;
        self.Label4.hidden = YES;
        self.Label4.text = @"";
    }
    if(stepCount == 4.0){
        self.Arrow1.hidden = NO;
        self.Arrow2.hidden = NO;
        self.Arrow3.hidden = NO;
        self.Label3.hidden = NO;
        self.Arrow4.hidden = NO;
        self.Label4.hidden = NO;
    }
    
}




@end
