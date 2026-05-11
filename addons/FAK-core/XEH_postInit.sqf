#include "script_component.hpp"

////////////////////////////////////////////////////////////////////////////////////////////////////
// CBA key binding
////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Function: CBA_fnc_addKeybind
//  
//  Description:
//   Adds or updates the keybind handler for a specified mod action, and associates
//   a function with that keybind being pressed.
//  
//  Parameters:
//   _modName           Name of the registering mod [String]
//   _actionId  	    Id of the key action. [String]
//   _displayName       Pretty name, or an array of strings for the pretty name and a tool tip [String]
//   _downCode          Code for down event, empty string for no code. [Code]
//   _upCode            Code for up event, empty string for no code. [Code]
//  
//  Optional:
//   _defaultKeybind    The keybinding data in the format [DIK, [shift, ctrl, alt]] [Array]
//   _holdKey           Will the key fire every frame while down [Bool]
//   _holdDelay         How long after keydown will the key event fire, in seconds. [Float]
//   _overwrite         Overwrite any previously stored default keybind [Bool]
//  
//  Returns:
//   Returns the current keybind for the action [Array]
//
////////////////////////////////////////////////////////////////////////////////////////////////////

// Associates a pretty name to a keybinding mod entry.
["EFAK", "Enhanced First Aid Kits"] call CBA_fnc_registerKeybindModPrettyName;

call FUNC(FAK_updateContents);