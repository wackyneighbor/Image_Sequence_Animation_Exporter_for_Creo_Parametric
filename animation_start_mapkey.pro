! Welcome to the Image Sequence Animation Mapkey Generator for Creo Parametric
! by Darren Cokin  v1.0 November 2018   General Public License
!
!  Mapkeys:
!    configanim = configure a new animation sequence, and start it running
!    cycleanim = restart animation using last configuration
!    importmapkey = reload last configuration created in previous session
!                   into current session, so 'cycleanim' is available 

! This subroutine imports the newly created animation_sequence_mapkey.pro file
! into the current Creo Parmametric session.
mapkey importmapkey @MAPKEY_LABELimports *.pro file with mapkey to save entire animation;\
mapkey(continued) ~ Close `main_dlg_cur` `appl_casc`;~ Command `ProCmdRibbonOptionsDlg` ;\
mapkey(continued) ~ Trail `UI Desktop` `UI Desktop` `PREVIEW_POPUP_TIMER` \
mapkey(continued) `main_dlg_w1:PHTLeft.AssyTree:<NULL>`;\
mapkey(continued) ~ Activate `ribbon_options_dialog` `ConfigLayout.Open`;\
mapkey(continued) ~ Trail `UI Desktop` `UI Desktop` `DLG_PREVIEW_POST` `file_open`;\
mapkey(continued) ~ Activate `file_open` `Current Dir`;\
mapkey(continued) ~ Select `file_open` `Ph_list.Filelist` 1 \
mapkey(continued) `animation_sequence_mapkey.pro`;\
mapkey(continued) ~ Trail `UI Desktop` `UI Desktop` `PREVIEW_POPUP_TIMER` \
mapkey(continued) `file_open:Ph_list.Filelist:<NULL>`;\
mapkey(continued) ~ Command `ProFileSelPushOpen_Standard@context_dlg_open_cmd` ;\
mapkey(continued) ~ Activate `ribbon_options_dialog` `OkPshBtn`;\
mapkey(continued) ~ FocusIn `UITools Msg Dialog Future` `no`;\
mapkey(continued) ~ Activate `UITools Msg Dialog Future` `no`;

! This mapkey launches the "animation_sequence_mapkey_generator.bat" utility,
! which will prompt the user for various inputs, and then write a custom
! animation_sequence_mapkey.pro file.  This mapkey then continues to call a
! subroutine to import that file into the current session, and then starts
! running the animation sequence via the mapkey in that file.
mapkey configanim @MAPKEY_LABELconfigures new animation and starts it;\
mapkey(continued) @SYSTEManimation_sequence_mapkey_generator.bat;\
mapkey(continued) %importmapkey;%cycleanim;
