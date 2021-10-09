# Touchstone Foundation Internship - Flutter Assignment.
This is my submission for Flutter Assignment Round.

## Project Structure
```
├───lib
│   ├───controllers
│   │   ├───screen_bedroom
│   │   └───screen_one
│   │       └───pages
│   ├───screens
│   │   ├───screen_bedroom
│   │   └───screen_one
│   │       └───pages
│   ├───utils
│   └───widgets
````

## Known Errors 

Assets.zip provided throught email contains an invalid svg file.
That cause rendering error.
```
════════ Exception caught by SVG ═══════════════════════════════════════════════
The following assertion was thrown while parsing AssetBundlePictureKey(bundle: PlatformAssetBundle#f9d81(), name: "assets/user.svg", colorFilter: null) in _getDefinitionPaint:
Failed to find definition for url(#pattern)

This library only supports <defs> and xlink:href references that are defined ahead of their references.

This error can be caused when the desired definition is defined after the element referring to it (e.g. at the end of the file), or defined in another file.

This error is treated as non-fatal, but your SVG file will likely not render as intended
════════════════════════════════════════════════════════════════════════════════
````
