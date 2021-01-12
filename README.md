# High Pressure Water Tap

Building a water tap with a reduced surface area for higher pressure and integrated brushes.

## Progress

1. [v1](./v1.stl)
    + Brushes to clean whilst water comes out
    + Brushes & grid holes are way too small
    + Threads are far too thick
    + Radial grid holes not optimal - just one big hole in middle
    + Takes too long to print (for prototype)

1. [v2](./v2.stl)
    + Testing M22x0.5 threads (way thinner)
    + Removing cone for quicker print
    + Removed brushes for quicker print
    + Square grid for constant padding between holes

1. [v3](./v3.5.stl)
    + Added honeycomb holes for better space usage
    + Holder for external o-ring
    + Added separate honeycomb holes to attach brushes
    + Does not print holes because they are too small or because printer's configuration was not on highest accuracy
    + Uses a lot of unnecessary material at the bottom around the holes for the padding

1. [v4](./v4.stl)
    + Made holes larger and also increased padding between holes
    + Used entire bottom surface for brush holes
    + Renamed variables for easier understanding
    + Corrected diameter for o-ring

## Install / Run

1. Install Openscad
2. Add [threadlib](https://github.com/adrianschlatter/threadlib) and all corresponding dependencies to Openscad library

To add libraries to Openscad

1. Download required repository
2. Find local library folder: [File] -> [Add libraries]
3. Move repository to library folder
