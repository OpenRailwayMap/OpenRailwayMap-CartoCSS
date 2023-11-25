# Contributing to the CartoCSS map styles of OpenRailwayMap

In this document, we provide a few tips if you want to contribute to the OpenRailwayMap CartoCSS map styles by creating pull requests.

## Code formatting

We use two spaces for indentation in our MapCSS and YAML files.

## Test your code

We like pull requests with example renderings. We will still make our own test renderings
but your test renderings help you to find bugs. You can use the provided Docker setup.

If you provide test renderings or not, we appreciate recommendations for locations where to
make our test renderings.

## New signalling systems

Each country (sometimes each company) has their own signalling system. We welcome
other systems than those already supported by the style. New signals must be documented
on the OSM wiki and be actively used.

## Map key

The map key still makes use of the
[old MapCSS styles](https://github.com/OpenRailwayMap/OpenRailwayMap/tree/master/styles)
in the main repository. The `.mapcss` files are the style, the `.json` files
are the definition of the map key.

## Icons

All icons must be SVG files because we do not want to leave the users of the
style the freedom to render map images in any resolution they want. If someone
wants to print out OpenRailwayMap, they will benefit from a sharp icons.

Please mind the following recommendations when you add new icons:

* Country specific icons should be saved in `symbols/<country_code>/`.
  If your country has different signals for different railway networks (e.g.
  heavy rail and trams), it will be a good idea to create a subdirectory within
  the country's directory. See Germany as an example.
* File names should match either the signal names, their abbreviations or their
  English names.
* Keep in mind that the icons will be pretty small. Don't draw to detailed graphics.
* Icons should not have any padding.
* Signals (including boards) should not have a pole (except corner cases like poles
  being a signal).
* SVG filters are not supported by Mapnik.
* Text should be inserted as paths.
* Please have a look at the XML code of your SVG files. We do not want XML code
  full of metadata from your drawing software.
* We do not remove unnecessary whitespace from our SVG files.

## Icons for speed signals

Icons for speed signals should be provided in all existing variants if the speed signal
displays a number. If the signal shows a 5 for 50 kph, we want to render the icon with a 5,
not 9. Do not worry if you do not know all variants of that icon. Just add some variants,
the other ones can be add in the future.

## Other remarks

Please do not mix pure formatting changes with other changes. Diffs are read by humans. ;-)
