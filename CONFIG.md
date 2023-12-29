# Theme configuration

This file explains what each option does and what parameters are valid. In general, an option may accept a string, number, or boolean. Colors are simply strings but written in hex code. They can also include transparency values as seen in this [Qt documentation about colors](https://doc.qt.io/qt-5/qml-color.html). Don't forget the leading "#"!

## General

- `BgSource`: string. Path to an image, used as the wallpaper. Can be placed in the `backgrounds/` folder for convenience.
- `FontFamily`: string. Name of the font family. You can find this with something like `fontconfig`, for example.
- `FontSize`: number. This value is used for everything *except* the [date and time](#date-time).
- `Padding`: number. How far away things should be from the edge of your screen.
- `Radius`: number. Corner radius for UI. Set to 0 to disable rounded corners.
- `Scale`: number. Adjusts the size of UI elements. Can be anything, but I would stick between 1 and 2 (e.g. 1.5).

## User picture

- `UserPictureEnabled`: boolean. By default the user picture is shown. Set to false if you don't have/want a user picture, or you don't use the user selection functionality.
- `UserBorderWidth`: number. Width of the border around your picture. Set to 0 to remove.
- `UserBorderColor`: color. Border color around your picture. Useless if border width is 0.
- `UserColor`: color. Background color of the default, blank avatar. Only visible if you don't have your own picture.

## Input fields (username, password)

- `InputColor`: color. Background color of the input fields.
- `InputTextColor`: color. Color of text you enter in the fields.
- `InputBorderWidth`: number. Width of the border around the active field. Set to 0 to remove.
- `InputBorderColor`: color. Border color of active field. Useless if border width is 0.
- `UserPlaceholderText`: string. Placeholder text shown when user field is empty.
- `PassPlaceholderText`: string. Placeholder text shown when user field is empty.
- `HidePassword`: boolean. Whether to replace your entered password with dots.

## Login button

- `LoginButtonTextColor`: color. Text color on the login button.
- `LoginButtonText`: string. Text displayed on the button.
- `LoginButtonColor`: color. Background color of the button.

## Power, session, user selection popups

This refers to the popup window that appears when you click on the power/session buttons or the user picture.

- `PopupColor`: color. Background color of popup window.
- `PopupActiveColor`: color. Color around the currently selected entry.
- `PopupActiveTextColor`: color. Text color of the currently selected entry. Mainly provided for potential contrast issues.

## Power, session buttons

- `SessionButtonColor`: color. Session button background color.
- `SessionIconColor`: color. Color of the icon inside the session button.
- `PowerButtonColor`: color. Power button background color.
- `PowerIconColor`: color. Color of the icon inside the power button.

## Date, time

- `DateTimeSpacing`: number. Spacing between the date and time.
- `Date/TimeColor`: color. Date/time text color.
- `Date/TimeSize`: number. Font size for the date/time.
- `Date/TimeIsBold`: boolean. Whether date/time text should be bolded.
- `Date/TimeOpacity`: number. Date/time text opacity.
- `Date/TimeFormat`: string. Change the format of how the date and time is displayed. Note that they use different formats.

Happy configuring!