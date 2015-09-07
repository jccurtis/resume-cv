
## Notes!!

**Compile with XeLaTeX!**

This résumé started as the [friggeri cv](http://www.latextemplates.com/template/friggeri-resume-cv) but I didn't like the sidebar so I merged the contact content into the header. See friggeri-cv.zip for the original.

## FontAwesome

I used [FontAwesome](http://fortawesome.github.io/Font-Awesome/) for the icons with the `\fa` tag. This is enable with `\RequirePackage{fontawesome}` in `resume.cls`. See [here](http://tex.stackexchange.com/questions/132888/fontawesome-font-not-found) for setup details.

## XeLaTeX

[XeLaTeX cannot correctly scale otf fonts](http://tex.stackexchange.com/questions/134121/fontawesome-icons-are-getting-too-big-using-xelatex) so one should use the ttf variant.
