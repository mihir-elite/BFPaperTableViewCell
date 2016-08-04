//
//  BFPaperViewController.m
//  BFPaperTableViewCell
//
//  Created by Bence Feher on 7/17/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Bence Feher
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


#import "BFPaperViewController.h"
// Classes:
#import "SubclassOfPaperTableViewCell.h"


@interface BFPaperViewController ()
@property NSArray *colors;
@end

@implementation BFPaperViewController

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
    // Do any additional setup after loading the view.
    self.title = @"BFPaperTableViewCell";
    
    // Register BFPaperTableViewCell for our tableView:
    [self.tableView registerClass:[SubclassOfPaperTableViewCell class] forCellReuseIdentifier:@"BFPaperCell"];  // NOTE: This is not required if we declared a prototype cell in our storyboard (which this example project does). This is here purely for information purposes.
    
    // Fill up an array with all the basic BFPaperColors:
    self.colors = @[[UIColor colorWithRed:244.f/255.f green:67.f/255.f blue:54.f/255.f alpha:1],
                    [UIColor colorWithRed:233.f/255.f green:30.f/255.f blue:99.f/255.f alpha:1],
                    [UIColor colorWithRed:156.f/255.f green:39.f/255.f blue:176.f/255.f alpha:1],
                    [UIColor colorWithRed:103.f/255.f green:58.f/255.f blue:183.f/255.f alpha:1],
                    [UIColor colorWithRed:63.f/255.f green:81.f/255.f blue:181.f/255.f alpha:1],
                    [UIColor colorWithRed:33.f/255.f green:150.f/255.f blue:243.f/255.f alpha:1],
                    [UIColor colorWithRed:3.f/255.f green:169.f/255.f blue:244.f/255.f alpha:1],
                    [UIColor colorWithRed:0.f/255.f green:188.f/255.f blue:212.f/255.f alpha:1],
                    [UIColor colorWithRed:0.f/255.f green:150.f/255.f blue:136.f/255.f alpha:1],
                    [UIColor colorWithRed:76.f/255.f green:175.f/255.f blue:80.f/255.f alpha:1],
                    [UIColor colorWithRed:139.f/255.f green:195.f/255.f blue:74.f/255.f alpha:1],
                    [UIColor colorWithRed:205.f/255.f green:220.f/255.f blue:57.f/255.f alpha:1],
                    [UIColor colorWithRed:255.f/255.f green:235.f/255.f blue:59.f/255.f alpha:1],
                    [UIColor colorWithRed:255.f/255.f green:193.f/255.f blue:7.f/255.f alpha:1],
                    [UIColor colorWithRed:255.f/255.f green:152.f/255.f blue:0.f/255.f alpha:1],
                    [UIColor colorWithRed:255.f/255.f green:87.f/255.f blue:34.f/255.f alpha:1],
                    [UIColor colorWithRed:121.f/255.f green:85.f/255.f blue:72.f/255.f alpha:1],
                    [UIColor colorWithRed:158.f/255.f green:158.f/255.f blue:158.f/255.f alpha:1],
                    [UIColor colorWithRed:96.f/255.f green:125.f/255.f blue:139.f/255.f alpha:1],
                    [UIColor colorWithRed:97.f/255.f green:97.f/255.f blue:97.f/255.f alpha:1],
                    [UIColor colorWithRed:97.f/255.f green:97.f/255.f blue:97.f/255.f alpha:1]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.7 green:0.98 blue:0.7 alpha:1];
    self.tableView.delaysContentTouches = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIImageView *bgIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-blue-white-arrow"]];
    bgIV.contentMode = UIViewContentModeScaleAspectFill;
    bgIV.frame = self.tableView.frame;
    self.tableView.backgroundView = bgIV;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Every 5th cell gets to push:
    if (indexPath.row % 5 == 0) {
        [self performSegueWithIdentifier:@"push" sender:self];
    }
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.colors.count * 2; // We will have one set of cells with a white background and colored text, and one set with a colored background and white text.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubclassOfPaperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BFPaperCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[SubclassOfPaperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BFPaperCell"];
    }
    
    // Configure the cell...
    
    // This is a whole bunch of really BAD ways to customize cells that I'm, just doing for the demo.
    // I hope you won't attempt to customize your cells in such a way and would rather sub-class BFPaperTableViewCell and do your customizations in said subclass.
    // Or at least just don't do it like this ;p
    
    // Every 5th cell gets to push, so give it a disclosure indicator:
    if (indexPath.row % 5 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Even indexed cells will ripple from the center while odd ones will ripple from tap location:
    if (indexPath.row % 2 == 0) {
        cell.rippleFromTapLocation = NO;
        cell.textLabel.text = @"Ripple from Center";
    }
    else {
        cell.rippleFromTapLocation = YES;
        cell.textLabel.text = @"Ripple from tap location";
    }

    // Demo 2 clear cells:
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor colorWithRed:198.f/255.f green:255.f/255.f blue:0.f/255.f alpha:1];
        cell.usesSmartColor = YES;
        cell.textLabel.text = @"Clear, Smart Color";
        cell.tapCircleDiameter = bfPaperTableViewCell_tapCircleDiameterFull;
    }
    else if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor colorWithRed:198.f/255.f green:255.f/255.f blue:0.f/255.f alpha:1];
        cell.usesSmartColor = NO;
        cell.textLabel.text = @"Clear, !Smart Color";
        cell.tapCircleDiameter = bfPaperTableViewCell_tapCircleDiameterFull;
    }
    // The rest of the first half should be white with colored text:
    else if (indexPath.row < self.colors.count){
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [self.colors objectAtIndex:indexPath.row];
        cell.usesSmartColor = YES;
        cell.tapCircleDiameter = bfPaperTableViewCell_tapCircleDiameterFull;
    }
    // After that, just color their background and give them white text:
    else if (!(indexPath.row > (self.colors.count * 2) - 3)) {
        cell.backgroundColor = [self.colors objectAtIndex:indexPath.row % self.colors.count];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.usesSmartColor = YES;
        cell.tapCircleDiameter = bfPaperTableViewCell_tapCircleDiameterFull;
    }
    // Customize last two cells:
    else {//if (indexPath.row > (self.colors.count * 2) - 3) {
        cell.textLabel.text = @"Customized!";
        cell.backgroundColor = [UIColor colorWithRed:103.f/255.f green:58.f/255.f blue:183.f/255.f alpha:1];
        cell.textLabel.textColor = [UIColor colorWithRed:3.f/255.f green:169.f/255.f blue:244.f/255.f alpha:1];
        cell.tapCircleDiameter = bfPaperTableViewCell_tapCircleDiameterSmall;
        cell.tapCircleColor = [[UIColor colorWithRed:198.f/255.f green:255.f/255.f blue:0.f/255.f alpha:1] colorWithAlphaComponent:0.7];
        cell.backgroundFadeColor = [UIColor whiteColor];
        cell.letBackgroundLinger = NO;
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];  // If it's not clear, the tap circles and fade layers are occluded by this label's background.
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

@end
