//
//  HUPreferences.m
//  Hues
//
//  Created by Zach Waugh on 12/21/10.
//  Copyright 2010 Giant Comet. All rights reserved.
//

#import "HuesPreferences.h"


@implementation HuesPreferences

+ (void)registerDefaults
{
  NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
  
  // Auto copy to clipboard on
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesCopyToClipboardKey];
  
  // Hex is default
  [defaults setObject:[NSNumber numberWithInt:HuesHexRepresentation] forKey:HuesDefaultColorRepresentationKey];
  
  // Don't default to lowercase
  [defaults setObject:[NSNumber numberWithBool:NO] forKey:HuesUseLowercaseKey];
  
  // Color formats
  [defaults setObject:@"#{r}{g}{b}" forKey:HuesHexFormatKey];
  [defaults setObject:@"rgb({r}, {g}, {b})" forKey:HuesRGBFormatKey];
  [defaults setObject:@"rgba({r}, {g}, {b}, {a})" forKey:HuesRGBAFormatKey];
  [defaults setObject:@"hsb({h}, {s}%, {b}%)" forKey:HuesHSBFormatKey];
  [defaults setObject:@"hsl({h}, {s}%, {l}%)" forKey:HuesHSLFormatKey];
  [defaults setObject:@"hsla({h}, {s}%, {l}%, {a})" forKey:HuesHSLAFormatKey];
  
  // Color Pickers
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorWheelPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorSlidersGrayPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorSlidersRGBPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorSlidersCMYKPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorSlidersHSBPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowColorPalettesPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowImagePalettesPickerKey];
  [defaults setObject:[NSNumber numberWithBool:YES] forKey:HuesShowCrayonsPickerKey];
  
  [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}


+ (HuesColorRepresentation)defaultRepresentation
{
  return [[NSUserDefaults standardUserDefaults] integerForKey:HuesDefaultColorRepresentationKey];
}


+ (BOOL)useLowercase
{
  return [[NSUserDefaults standardUserDefaults] boolForKey:HuesUseLowercaseKey];
}


+ (void)setUseLowercase:(BOOL)lowercase
{
  [[NSUserDefaults standardUserDefaults] setBool:lowercase forKey:HuesUseLowercaseKey];
}


+ (NSString *)hexFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesHexFormatKey];
}


+ (NSString *)rgbFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesRGBFormatKey];
}


+ (NSString *)rgbaFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesRGBAFormatKey];
}


+ (NSString *)hsbFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesHSBFormatKey];
}


+ (NSString *)hslFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesHSLFormatKey];
}


+ (NSString *)hslaFormat
{
  return [[NSUserDefaults standardUserDefaults] stringForKey:HuesHSLAFormatKey];
}


+ (BOOL)copyToClipboard
{
  return [[NSUserDefaults standardUserDefaults] boolForKey:HuesCopyToClipboardKey];  
}


+ (void)setCopyToClipboard:(BOOL)copy
{
  [[NSUserDefaults standardUserDefaults] setBool:copy forKey:HuesCopyToClipboardKey];
  [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSUInteger)pickerMask
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  
  NSUInteger colorWheel = ([defaults boolForKey:HuesShowColorWheelPickerKey]) ? NSColorPanelWheelModeMask : 0;
  NSUInteger colorSliderGrayscale = ([defaults boolForKey:HuesShowColorSlidersGrayPickerKey]) ? NSColorPanelGrayModeMask : 0;
  NSUInteger colorSliderRGB = ([defaults boolForKey:HuesShowColorSlidersRGBPickerKey]) ? NSColorPanelRGBModeMask : 0;
  NSUInteger colorSliderCMYK = ([defaults boolForKey:HuesShowColorSlidersCMYKPickerKey]) ? NSColorPanelCMYKModeMask : 0;
  NSUInteger colorSliderHSB = ([defaults boolForKey:HuesShowColorSlidersHSBPickerKey]) ? NSColorPanelHSBModeMask : 0;
  NSUInteger colorPalettes = ([defaults boolForKey:HuesShowColorPalettesPickerKey]) ? NSColorPanelColorListModeMask : 0;
  NSUInteger imagePalettes = ([defaults boolForKey:HuesShowImagePalettesPickerKey]) ? NSColorPanelCustomPaletteModeMask : 0;
  NSUInteger crayons = ([defaults boolForKey:HuesShowCrayonsPickerKey]) ? NSColorPanelCrayonModeMask : 0;
  
  return (colorWheel | colorSliderGrayscale | colorSliderRGB | colorSliderCMYK | colorSliderHSB | colorPalettes | imagePalettes | crayons);
}


//+ (BOOL)useCalibratedColors
//{
//  return [[NSUserDefaults standardUserDefaults] boolForKey:HuesUseCalibratedColorsKey]; 
//}
//
//
//+ (void)setCalibratedColors:(BOOL)calibrated
//{
//  [[NSUserDefaults standardUserDefaults] setBool:calibrated forKey:HuesUseCalibratedColorsKey];
//  [[NSUserDefaults standardUserDefaults] synchronize];
//}

@end