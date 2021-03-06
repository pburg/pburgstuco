# Pre-Release Change Log

A summary of the changes to the web app will be added to this file with each
production release. For a more detailed history of changes, see the commit
history.

Once the app is complete, the version will be bumped to 1.0 and this change log
will be replaced with one that will track the progress for the rest of the
app's lifetime. This file will still be available in the commit history, of
course.

## 0.1

This is the initial deployment, just to get the application up on the server.
It is nothing but a shell of what the website one day will be.

## 0.2

Another prerelease, bringing a few changes and some content for the
Constitution.

### Additions

 * Added content for the Constitution
 * Added unique page titles
 * Tweaked some margins

## 0.3

### Additions

 * Added content for the Members page
 * Added ID's to header elements
 * Made the navigation bar's position absolute

## 0.4

While not yet complete, this prerelease is a large step forward.

### Additions

 * Contact page added
 * Events page prepared
 * Home page now has a bit of content
 * Placeholder content on Downloads and Photos pages

## 0.5

### Additions

 * Added some PDFs for download
 * Put the links up on the Downloads page, could use more design in the future

## 0.6

A lot of content added for this one. Only one page, but it's a lot of content.
Unfortunately all of the photos bump the slug size to 30.7 MB, but it had to be
done eventually.

### Additions

 * Added Photo Gallery

### Bug Fixes

 * Fixed buggy positioning of "Fork me on GitHub" ribbon on IE

### To Do

 * Make "Fork me on GitHub" ribbon easily clickable in IE like it is in every
   sane browser

## 0.7

Mostly subtle changes here.

### Additions

 * Added some upcoming events to the Events page
 * Added a PSA for IE users to switch browsers

### Changes

 * Changed the GitHub link on the left side of the footer to the version
   number and a link to that version's entry in the change log
 * Made Officers table on the Members page striped without hover

## 0.8

Cleaned up some dependencies and added some nifty stuff for development. Also
a few user-facing fixes specified below.

### Security

 * Secured secret token

### Improvements

 * Better Downloads page - loads files dynamically and displays them in a table
   along with file type and size

### Fixes

 * Minor spelling/sematics fixes

## 0.9

One of the more subtle updates.

### Additions

 * Boilerplate comment at the top of the page source
 * An easter egg...

### Improvements

 * Internal refactoring
 * Better "x" button for anti-IE PSA

## 0.10

### Additions

 * Traffic statistics on GoSquared

### Improvements

 * Internal improvements

## 0.11

I sat on this one for a while, because I wasn't sure if enough was accumulated
to be worth putting out, but I figured that the validation fixes were
important enough to warrant release.

### Additions

 * Specified UTF-8 charset explicitly (for saving pages to disk)

### Fixes

 * Fixed W3C HTML5 validation

### Improvementes

 * Minor performance boosts
 * Internal clean-up

## 0.11.1

This hotfix fixes the Photos page.

### Fixes

 * Fixed broken lightbox (breaks HTML5 compliance of the Photos page, however)

## 0.12

### Improvements

 * Made pages load a lot faster

### Changes

 * Updated Events page
