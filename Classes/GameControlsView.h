//
//  GameControlsView.h
//  Flashback
//
//  Created by Stuart Carnie on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

class CJoyStick;
class PlayerInput;
class iPhoneStub;

@interface GameControlsView : UIView {
	PlayerInput							*playerInput;
	CJoyStick							*TheJoyStick;
	iPhoneStub							*systemStub;
	
	UIButton							*_fire;
	UIButton							*_gun;
	UIButton							*_items;
	UIButton							*_use;
	UIButton							*_menu;
	
	UIImage								*_selectImage;
	UIImage								*_scoreImage;
	UIImage								*_skipImage;
	UIImage								*_itemsImage;
	UIImage								*_useImage;
	id									_delegate;
}

@property (nonatomic, assign)			PlayerInput		*playerInput;
@property (nonatomic, assign)			CJoyStick		*TheJoyStick;
@property (nonatomic, assign)			iPhoneStub		*systemStub;
@property (nonatomic, assign)			id				delegate;

@property (nonatomic, assign) IBOutlet	UIButton		*fire;
@property (nonatomic, assign) IBOutlet	UIButton		*gun;
@property (nonatomic, assign) IBOutlet	UIButton		*items;
@property (nonatomic, assign) IBOutlet	UIButton		*use;
@property (nonatomic, assign) IBOutlet	UIButton		*menu;

- (IBAction)fireButton:(UIButton*)sender;
- (IBAction)itemsButton:(id)sender;
- (IBAction)optionsButton:(id)sender;

@end

@protocol GameControlsDelegate <NSObject>

@optional

- (void)didSelectMenuButton;

@end

