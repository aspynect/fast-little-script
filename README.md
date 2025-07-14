# fast-little-script
AutoHotkey script for Deltarune speedruns to alleviate the need for sticky keys and/or a box

# features
## shift toggle
treats the shift key as a toggle key rather than a hold key, along with a beep to indicate whether it is being turned on or off

## ctrl inversion
always holds ctrl down unless the ctrl key is held, in which case it will release

## (num)enter toggle
treats the numpad enter key as a toggle key rather than a hold key, along with a beep to indicate whether it is being turned on or off (distinct beep from shift toggle)

## script escape
press esc to close the script

## window detection
if a non-deltarune window is focused, removes all functionality of the script. returns its state (whether or not shift/numenter are toggled) upon returning to the window
