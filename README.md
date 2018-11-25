**Image Sequence Animation Exporter for Creo Parametric**

by Darren Cokin, v1.0, November 2018

This is a utility for use with Creo Parametric, a 3D Computer Aided Design (CAD) package from Parametric Technology Corporation (PTC).  It is released with a General Public License.

Creo Parametric models may include "relations", code which is executed whenever the model is "regenerated".  This can include statements such as "value = value + 1", which will cause a value to grow continuously with every regeneration.  This can be useful for design studies, visualizing the motion of flexible items such as springs, and myriad other scenarios.  While setting up such a "regen loop" is trivial, there is no built-in function to automatically save an image file at each increment, that could be compiled into a GIF or other video format.  (Although Creo Parametric includes its own scripting language, which _can_ automate saving an image file, it is unable to automatically specify a unique filename for each new image.)

**Four files are provided:**

- **README.md** - this file
- **animation_relations_sample.txt** - Paste the contents of this file into the model you wish to animate, and follow included notes for creating needed model parameters
- **animation_start_mapkey.pro** - This file includes the code for the "mapkey" used to start the process.  Paste the contents of this into your "config.pro" settings file if you'd like this to be always available.  Otherwise, save the file somewhere convenient, such as your Creo "working directory", and import whenever needed.  (File / Options / Configuration Editor / Import configuration file)
- **animation_sequence_mapkey_generator.bat** - This generates a customized mapkey for the desired animation.  It MUST be saved in your Creo "working directory".

&nbsp;

**To use:**

- Set up model to be animated, using relations from sample file, and ensure the initial mapkeys have been imported into your current session.
- Type "configanim".
- Follow the instructions in the console window that appears.  You will be prompted for the number of regenerations to use between frames, the name of the saved view orientation to reset after regeneration (optional; only needed for perspective views), the number of frames to save, the height & width in pixels for the exported images, the filename prefix to use for the images, whether to use default of *.png image format, or switch to *.tif (Creo 2.0 doesn't support *.png).
- Image files will be saved to your Creo "working directory".

&nbsp;

**Alternatively:**

- To skip the configuration dialog and begin exporting a sequence using the same settings last configured, type "cycleanim".
- Import the "animation_sequence_mapkey.pro" file that was left in your working directory to use a "cycleanim" created in a previous session.

&nbsp;

**To avoid "letterboxed" output, and ensure on-screen annotations appear as WYSIWYG:**

Although you specify the precise dimensions of your output images, Creo will letterbox the results to match the _aspect ratio_ of your current model viewport window.  Additionally, any on-screen annotations that are shown will have proportions relative to your current model viewport, rather than the size of your output images.  The window size may shift along with changes to your computer's monitor resolution (such as if you shut the lid of a laptop).

To prevent these issues and ensure you get consistent output, it is advisable to lock the interactive viewport window to be the same dimensions you will use for image export.  You may do this with the hidden config.pro setting "**force_base_size 1280 720**" (where 1280 and 720 are the desired width and height in pixels, respectively).  Note that you must add this line to your config.pro *before* launching Creo.  Adding this config setting to an active session will have no effect, although you may change the current height and width settings at any time during a session where the setting was activated.  This is not a convenient setting to have in effect at any time when you are not exporting animations, so be sure to remove the line from your config.pro afterwards.  (Or comment out by preceding with "!")

&nbsp;

**Desired enhancements:**

- A convenient mechanism to cancel a recording in progress.
- Include system for moving light sources between frames, such as the sun going across the sky.  This could be accomplished by analyzing the location of two datum points, and writing the coordinates to a file outside of Creo.  Use *.bat file to parse this file for the coordinates, and create a customized *.dlg file specifying these locations as the source & aim point for a distant light.  Import the light to the current scene before saving image.
- Use photo-realistic rendering for each frame, rather than just saving an image.
