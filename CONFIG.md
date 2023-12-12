# configuration

colors require the leading `#` and all options have to be wrapped in quotation marks. refer to [this](https://doc.qt.io/qt-5/qml-color.html) link for more info regarding colors.

## general

- `Background`: wallpaper path, absolute or relative. can be placed in the `backgrounds/` folder for extra convenience.
- `Font`: please name the font family!
- `FontSize`: this size is used for everything *except* the date and time.
- `Padding`: specify how far stuff should be from the screen edges.
- `Radius`: set to 0 to disable rounded corners on UI elements.
- `UIScale`: if UI elements are too big or small, try to adjust this value. you should probably keep it below 1, though.

## user account picture (UAP)

- `UAPBorderWidth`: set to 0 to disable the border around the picture.
- `UAPBorderColor`: remember to include the "#" when specifying color! will not show when border width is 0.
- `UAPColor`: color of the default, blank avatar. only visible if you don't have your own picture.

## username, password fields

- `FieldBackground`: background color of the input fields.
- `FieldText`: color of the typed text.
- `FieldBorderWidth`: border width of the currently selected field. set to 0 to disable the border.
- `FieldBorderColor`: border color of selected field. not visible if width is 0.
- `UserFieldBgText`: placeholder text shown when user field is empty.
- `PassFieldBgText`: placeholder text shown when password field is empty.
- `PassHideInput`: immediately mask text input in the password field.

## login button

- `LoginButtonTextColor`: text color of login button.
- `LoginButtonText`: text displayed on login button.
- `LoginButtonBg`: login button background color.

## power, session, user selection popups
this refers to the popup window that appears when you click the power/session button
or user picture.

- `PopupBackground`: background color of popup window.
- `PopupHighlight`: color of the currently selected entry.
- `PopupHighlightText`: text color inside the currently selected entry. this is provided in case the highlight color clashes with the text.

## session, power buttons

- `SessionButtonBg`: session button background color.
- `SessionIconColor`: session icon color inside the session button.
- `PowerButtonBg`: power button background color.
- `PowerIconColor`: power icon color inside the power button.

## date, time
of course, equivalent options exist for the time (I'm too lazy to type them up).

- `DateColor`: date text color.
- `DateSize`: font size for the date.
- `DateIsBold`: whether date text should be bolded. accepts "true" or "false"
- `DateOpacity`: date text opacity value between 0.0 (completely transparent) and 1.0 (fully solid).
- `DateFormat`: here, you can create a custom date format.