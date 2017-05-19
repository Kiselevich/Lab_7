//
//  ViewController.m
//  drawing_lab7
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Oleg Kiselevich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlSize;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlType;
@property CGPoint lastPoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataArray = [[NSArray alloc]initWithObjects:@"Red",@"Green",@"Blue", nil];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    [self.picker setShowsSelectionIndicator:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [dataArray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    colorString = [dataArray objectAtIndex:row];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [self setLastPoint:[touch locationInView:self.view]];
}
- (IBAction)segmentedAction:(UISegmentedControl *)sender {
   size = [self.segmentedControlSize titleForSegmentAtIndex:self.segmentedControlSize.selectedSegmentIndex];
   
}
- (IBAction)buttonSave:(id)sender {
    UIImageWriteToSavedPhotosAlbum(self.canvas.image, nil, nil, nil);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width,
                                 
                                 self.view.frame.size.height);
    
    [[[self canvas] image] drawInRect:drawRect];
    
    if(self.segmentedControlType.selectedSegmentIndex == 0)
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);
    
    if(self.segmentedControlType.selectedSegmentIndex == 1)
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    if(self.segmentedControlType.selectedSegmentIndex == 2)
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    
    if(self.segmentedControlSize.selectedSegmentIndex == 0)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0f);
    
    if(self.segmentedControlSize.selectedSegmentIndex == 1)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 8.0f);
    
    if(self.segmentedControlSize.selectedSegmentIndex == 2)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0f);
    
    if(self.segmentedControlSize.selectedSegmentIndex == 3)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 12.0f);
    
    if(self.segmentedControlSize.selectedSegmentIndex == 4)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 15.0f);
    
    if([colorString isEqualToString:@"Red"])
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0f, 0.0f, 0.0f, 1.0f);
    
    if([colorString isEqualToString:@"Green"])
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 1.0f, 0.0f, 1.0f);
    
    if([colorString isEqualToString:@"Blue"])
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 0.0f, 1.0f, 1.0f);
    
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x,_lastPoint.y);
    
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x,currentPoint.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    
    UIGraphicsEndImageContext();
    
    _lastPoint = currentPoint;
}


@end
