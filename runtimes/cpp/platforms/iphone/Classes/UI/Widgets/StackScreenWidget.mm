/* Copyright (C) 2011 MoSync AB
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License, version 2, as published by
 the Free Software Foundation.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; see the file COPYING.  If not, write to the Free
 Software Foundation, 59 Temple Place - Suite 330, Boston, MA
 02111-1307, USA.
 */

#import "StackScreenWidget.h"
#include "Platform.h"
#include <helpers/cpp_defs.h>
#include <helpers/CPP_IX_WIDGET.h>
#include <base/Syscall.h>

@implementation StackScreenWidget

- (id)init {
    //view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UINavigationController* navigationController = [[UINavigationController alloc] init];
	//controller = navigationController;
	navigationController.viewControllers = [NSArray array];	
	//view = controller.view;
	
	return [super initWithController:navigationController];
}

- (void)addChild: (IWidget*)child {

}

/*
- (int)insertChild: (IWidget*)child atIndex:(NSNumber*)index {
	int ret = [super insertChild:child atIndex:index toSubview:NO];
	if(ret!=MAW_RES_OK)
		return ret;
	
	UINavigationController* navigationController = (UINavigationController*)controller;
	ScreenWidget* screen = (ScreenWidget*)child;
	NSMutableArray *newItems = [NSMutableArray arrayWithArray:navigationController.viewControllers];
	[newItems insertObject:[screen getController] atIndex:[index intValue]];
	navigationController.viewControllers = newItems;
	
	//[super addChild:child];
//	[navigationController popToRootViewControllerAnimated:YES];

	return MAW_RES_OK;
}
*/

/*
- (void)removeChild: (IWidget*)child {	
	[super removeChild:child fromSuperview:NO];
}
*/

- (void)push: (IWidget*)child {
	UINavigationController* navigationController = (UINavigationController*)controller;
	ScreenWidget* screen = (ScreenWidget*)child;
	[navigationController pushViewController:[screen getController] animated:YES];
	
	/*
	 [super addChild:child toSubview:NO];

	int navBarHeight = navigationController.toolbar.bounds.size.height;
	int viewWidth = view.frame.size.width; 
	int viewHeight = view.frame.size.height - navBarHeight; 	
	UIView* childView = [screen getView];
	[childView setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
	 */
}

- (void)pop {
	UINavigationController* navigationController = (UINavigationController*)controller;
	[navigationController popViewControllerAnimated:YES];	
}


- (int)setPropertyWithKey: (NSString*)key toValue: (NSString*)value {
	if([key isEqualToString:@"title"]) {
		controller.title = value;
	} else {
		return [super setPropertyWithKey:key toValue:value];
	}
	return MAW_RES_OK;	
}

- (NSString*)getPropertyWithKey: (NSString*)key {
	
	return [super getPropertyWithKey:key];
}

- (UIViewController*) getController {
	return controller;
}

- (void)layout {
	UINavigationController* navController = (UINavigationController*)controller;
	
	int navBarHeight = navController.toolbar.bounds.size.height;
	int viewWidth = view.frame.size.width; 
	int viewHeight = view.frame.size.height - navBarHeight; 
	
	[view setNeedsLayout];
	//[view setNeedsDisplay]
	for (IWidget *child in children)
    {
		UIView* childView = [child getView];
		[childView setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];		
		
		[child layout];
		
	}
}


@end