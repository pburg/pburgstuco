# PHS Student Council Photo Gallery

All of the albums to be shown on the Photos page of the website go into here.
When you add an album, it will be parsed right onto the page with no need to
touch any code.

## Guidelines

To ensure that the process goes smoothly for the internal magic of the website,
follow the following guidelines:

 * Please do **not** put spaces in any file or directory names.
 * The name of the directory will be made into the title of the album. Name the
   directory using lowercase with underscores. For example, the "Turkey Day
   Game" album is named ```turkey_day_game```.
 * The images should be in one of the following formats:
   * JPEG (```.jpg```)
   * PNG (```.png```)
   * GIF (```.gif```)
 * Name each image with numbers in the order that you want them displayed. For
   example, ```1.jpg```, ```2.jpg```, ```3.jpg```, etc.

## Thumbnails

Thumbnails for each image, while technically optional, are **highly**
recommended to allow the page to load quickly. Each thumbnail should be at
least 100 pixels in both width and height, but not much higher if it can be
helped.

To add thumbnails for an album, place them into a directory named ```thumbs```
inside of that album. The thumbnails should have the same filenames as each of
their actual size counterparts. For example, the thumbnail for
```turkey_day_game/1.jpg``` is at ```turkey_day_game/thumbs/1.jpg```. See some
of existing albums for some live examples.

If there is no thumbnail for an image, the entire full-sized image will be
loaded onto the page and shrunk down to the proper size. This causes
exceedingly slow page load times. Once again, please use thumbnails.

There are tools out there to generate them en masse for you- I'd recommend
looking into them before you spend an hour doing them individually in a photo
editor.
