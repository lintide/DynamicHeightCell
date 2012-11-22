//
//  AGUViewController.m
//  DynamicHeightCell
//
//  Created by lintide on 12-11-23.
//  Copyright (c) 2012年 lintide. All rights reserved.
//

#import "AGUViewController.h"

@interface AGUViewController ()

@end

@implementation AGUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _quotes = @[@"I do the very best I know how-the very best I can; and I mean to keep doing so until the end. If the end brings me out all right, what is said against me won't amount to anything. If the end brings me out wrong, ten angels swearing I was right would make no difference.",
    @"Be systematically heroic in little unnecessary points, do every day or two something for no other reason than its difficulty, so that, when the hour of need draws nigh, it may find you not unnerved or untrained to stand the test.",
    @"The trick of it, she told herself, is to be courageous and bold and make a difference. Not change the world exactly, just the bit around you. Go out there with your double-first, your passion and your new Smith Corona electric typewriter and work hard at ... something. Change lives through art maybe. Write beautifully. Cherish your friends, stay true to your principles, live passionately and fully well. Experience new things. Love and be loved if at all possible. Eat sensibly. Stuff like that.",
    @"I know of no more encouraging fact than the unquestioned ability of a man to elevate his life by conscious endeavor."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_quotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = [_quotes objectAtIndex:[indexPath row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *quote = [_quotes objectAtIndex:[indexPath row]];
    CGSize size = [quote sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(300, CGFLOAT_MAX)];
    
    return size.height + 10;
}
@end
